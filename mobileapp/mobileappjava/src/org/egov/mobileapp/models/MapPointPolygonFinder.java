package org.egov.mobileapp.models;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javassist.ClassPath;

import org.geotools.data.DataStore;
import org.geotools.data.DataStoreFinder;
import org.geotools.data.FeatureSource;
import org.geotools.feature.FeatureCollection;
import org.geotools.geometry.jts.JTSFactoryFinder;
import org.opengis.feature.simple.SimpleFeature;

import com.vividsolutions.jts.geom.Coordinate;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.Point;



public class MapPointPolygonFinder  {



	@SuppressWarnings({ "unchecked", "deprecation", "static-access" })
	public Object getAssetIdFromPolygon(Double latitude,Double longitude){

		try {

			if(latitude!=null && longitude!=null){

				URL shapefile =this.getClass().getClassLoader().getResource("config/coc_hackathon.shp");
				File file = new File(shapefile.toURI());
				Map map = new HashMap();
				map.put( "url", file.toURL() );
				DataStore dataStore = DataStoreFinder.getDataStore(map);
				String typeName = dataStore.getTypeNames()[0];
				FeatureSource source = dataStore.getFeatureSource(typeName);

			
				
				FeatureCollection collection = source.getFeatures();
				Iterator iterator =  collection.iterator();
				GeometryFactory geometryFactory = JTSFactoryFinder.getGeometryFactory( null );
				Coordinate coord = new Coordinate( longitude,latitude);
				Point point = geometryFactory.createPoint( coord );
				
				//System.out.println("Size --------------------"+collection.size());
				//System.out.println("Latitude -----"+ latitude );
				//System.out.println("Longitude -----"+ longitude );
				
				try {
					while( iterator.hasNext() ){
						SimpleFeature  feature = (SimpleFeature) iterator.next();
						Geometry geom = (Geometry)feature.getDefaultGeometry();

						if(geom.contains(point))
						{
					 		return  feature.getAttribute("asset_name");

						}/*else
						{
							return null;
						}*/

					}
					return null;
				}
				finally {
					collection.close( iterator );
				}


			}else

				return null;} catch (IOException e) {
					e.printStackTrace();
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				return null;

	}
}

