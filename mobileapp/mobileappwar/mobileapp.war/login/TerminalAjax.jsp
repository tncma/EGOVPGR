<%@ page language="java"
	import="org.egov.infstr.security.utils.SecurityUtils,
	java.sql.Connection,
	java.sql.PreparedStatement,
	java.sql.ResultSet,
	org.egov.infstr.utils.EGovConfig,
	org.egov.infstr.utils.HibernateUtil,
	java.util.ArrayList"%>

<%
	try {
		String username = SecurityUtils.checkSQLInjection(request.getParameter("username"));
		StringBuilder rsltQ = new StringBuilder();
		if (username != null && !username.trim().equalsIgnoreCase("")) {
			Connection con = HibernateUtil.getCurrentSession().connection();
			PreparedStatement stmt = con.prepareStatement("SELECT r.role_name FROM eg_roles r, eg_user u, eg_userrole ur WHERE u.id_user = ur.id_user and r.id_role = ur.id_role and u.isactive=1 and u.is_suspended='N' and u.todate >= sysdate and ur.is_history='N' and ur.todate >= sysdate and u.user_name = ? ");
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			ArrayList<String> userRoles = new ArrayList<String>();
			while (rs.next()) {
				userRoles.add(rs.getString(1));
			}
			rs.close();
			stmt.close();
			boolean locationbased = false;

			if (userRoles.isEmpty()) {
				rsltQ.append(locationbased);
				rsltQ.append("|");
			} else {
				String configuredRoles = EGovConfig.getProperty("INCLUDE_ROLES", "", "IP-BASED-LOGIN");
				String[] include_roles = configuredRoles.split(",");
				for (int u = 0; u < include_roles.length; u++) {
					for (String role : userRoles) {
						if (role.equals(include_roles[u]) && !"".equals(include_roles[u]) && !"".equals(role)) {
							locationbased = true;
							break;
						}
					}
				}

				rsltQ.append(locationbased);
				rsltQ.append("|");
				stmt = con.prepareStatement("SELECT ucm.counterid, l.LOCATIONID  FROM eg_user u, eg_usercounter_map ucm, eg_location l WHERE ucm.userid = u.id_user and ucm.counterid = l.id and u.user_name = ? ");
				stmt.setString(1, username);
				rs = stmt.executeQuery();
				if (rs.next()) {
					if (rs.getString(2) != null) { //parent location present so return that

						rsltQ.append(rs.getString(2));
						rsltQ.append("^");
						rsltQ.append(rs.getString(1));
					} else {
						rsltQ.append(rs.getString(1));
						rsltQ.append("^");
						rsltQ.append("0");
					}
				}
				rs.close();
				stmt.close();
			}
		}
		
		response.setContentType("text/plain;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(rsltQ.toString());
	} catch (Exception e) {
		throw new RuntimeException("Error occurred while getting User Terminal information", e);
	}
%>