Historic Long Beach Island (LBI), NJ cross-shore GIS analysis ReadMe file


ReadMe file update: Last updated May 31, 2022



GIS shapefiles and georeferenced maps included in this database were developed to accompany:

	Tenebruso, C., Lorenzo-Trueba, J., Ciarletta, D., Miselis, J., Nichols-O'Neill, S. (submitted). The effect of development and coastal
	engineering on the evolution of a barrier-marsh-lagoon system: Insights from Long Beach Island, New Jersey.


Long Beach Island, New Jersey cross-shore evolution GIS analysis 


Methodology
	
	To track cross-shore geomorphic environment change, historic maps including NOAA t-sheets and nautical charts were georeferenced and 
	digitized in a GIS environment. Polygons were generated for each geomorphic region of interest including barrier,
	backbarrier marsh, lagoon and inland marsh polygons. Total area for each region was calculated each year. Average environment
	cross-shore widths were calculated by dividing environment areas by the field site's alongshore length. Ocean shoreline position
	change was tracked by generating polygons between ocean shorelines of each year of interest. Average cross-shore shoreline position 
	change was calculated by dividing the difference of the total landward and seawars area change by the field site's alongshore length.
	Combining ocean shoreline position change with environment boundary change, overall barrier-backbarrier-lagoon system evolution can be 
	analyzed. 

Map Info

	Maps were georeferenced using the WGS 1984 datum and UTM Zone 18 N projection. 

	LBI_1839_t_sheet_121

		title: FROM BARNEGAT INLET TO HICKEY ISLAND NEW JERSEY
		image: T121
		type: t-sheet
		author: US Coast Survey
		publication date: Year = 1839
		scale: 1:20000

		Image from NOAA's Non-georeferenced NOAA Shoreline Survey Scans https://nosimagery.noaa.gov/images/shoreline_surveys/survey_scans/NOAA_Shoreline_Survey_Scans.html
		
	 
		direct url: https://nosimagery.noaa.gov/images/shoreline_surveys/survey_scans/T121.jpg


	LBI_1840_t_sheet_119_north

		title: MAP OF PART OF THE ATLANTIC COAST OF NEW JERSEY FROM BARNEGAT BAY TO LITTLE EGG HARBOR: PART 1 OF TWO PARTS
		image: T119-1
		type: t-sheet
		author: US Coast Survey 
		publication date: YEAR = 1840-1841
		scale: 1:20000

		Image from NOAA's Non-georeferenced NOAA Shoreline Survey Scans https://nosimagery.noaa.gov/images/shoreline_surveys/survey_scans/NOAA_Shoreline_Survey_Scans.html
		
	 
		direct url: https://nosimagery.noaa.gov/images/shoreline_surveys/survey_scans/T119-2.jpg

	LBI_1840_t_sheet_119_south

		title: MAP OF PART OF THE ATLANTIC COAST OF NEW JERSEY FROM BARNEGAT BAY TO LITTLE EGG HARBOR: PART 2 OF TWO PARTS
		image: T119-1
		type: t-sheet
		author: US Coast Survey
		publication date: YEAR = 1840-1841
		scale: 1:20000

		Image from NOAA's Non-georeferenced NOAA Shoreline Survey Scans https://nosimagery.noaa.gov/images/shoreline_surveys/survey_scans/NOAA_Shoreline_Survey_Scans.html
		
	 
		direct url: https://nosimagery.noaa.gov/images/shoreline_surveys/survey_scans/T119-1.jpg

	LBI_1879_naut_chart

		title: FROM BARNEGAT INLET TO ABSECON INLET, NEW JERSEY
		image: LC00122_09_1879
		type: Nautical Chart
		author: US Coast & Geodetic Survey
		publication date: Year = 1879, Month = 9
		scale: 1:80000

		Image from NOAA's Office of Coast Survey Historical Map & Chart Collection https://historicalcharts.noaa.gov
		
	 
		direct url: https://www.historicalcharts.noaa.gov/image.php?filename=LC00122_09_1879


	LBI_1934_naut_chart

		title: Sea Girt Light to Little Egg Inlet
		image: 1216-5-1934
		type: Nautical Chart
		author: US Coast & Geodetic Survey
		publication date: Year = 1934, Month = 5
		scale: 1:80000

		Image from NOAA's Office of Coast Survey Historical Map & Chart Collection https://historicalcharts.noaa.gov
		
	 
		direct url: https://www.historicalcharts.noaa.gov/image.php?filename=1216-5-1934

	LBI_2022_ENC_naut_chart

		title: SEA GIRT TO LITTLE EGG INLET 
		chart: 12323 - US4NJ23M - edition 16.3
		type: NOAA ENC - Electronic Navigational Chart (S57)
		author: NOAA Office of Coast Survey
		publication date: Year = 2022, Month = 4, Day = 18
		scale: 1:80000
		
		Chart from NOAA's Office of Coast Survey NOAA ENC https://nauticalcharts.noaa.gov/charts/noaa-enc.html
 
		direct url: https://charts.noaa.gov/ENCs/Agreement.shtml?US4NJ23M
		
		Note: NOAA ENC in s57 format exported to shapefile format for analysis (See "23Mareas_land_area.shp" in GIS File Info section)

GIS File Info
	
	GIS analysis area of interest covers the section of the barrier-backbarrier-lagoon system unaffected by tidal infleunces including 
	regions adjacent to Barnegat Inlet and Little Egg Inlet. 
	
	Shapefile: backbarrier_1840
			
		Polygons representing 1840 barrier coverage area across field site. 

	Shapefile: backbarrier_marsh_1840
			
		Polygons representing 1840 backbarrier marsh coverage area across field site. Backbarrier marsh defined as marsh region 
		connected to the barrier. 

		Historic map and GIS polygon discrepancy: marsh region near Beach Haven, NJ removed from analysis to prevent marsh loss due to 
		development and therefore distort the calculation of the backbarrier marsh-lagoon boundary change during phase I. Beach Haven was the first significant 
		settlement at LBI that resulted in significant marsh loss due to development during the last stage of phase I. 

	Shapefile: lagoon_1840
			
		Polygons representing 1840 lagoon coverage area across field site. Small islands within lagoon environment are defined
		as lagoon area. 

	Shapefile: inland_marsh_1840
	
		Polygons representing 1840 inland marsh coverage area across field site. 

	Shapefile: barrier_1879
			
		Polygons representing 1879 barrier coverage area across field site. 

	Shapefile: backbarrier_marsh_1879
			
		Polygons representing 1879 backbarrier marsh coverage area across field site. Backbarrier marsh defined as marsh region 
		connected to the barrier. 

		Historic map and GIS polygon discrepancy: marsh region near Beach Haven, NJ removed from analysis to prevent marsh loss due to 
		development and therefore distort the calculation of the backbarrier marsh-lagoon boundary change during phase I. Beach Haven was the first significant 
		settlement at LBI that resulted in significant marsh loss due to development during the last stage of phase I. 

	Shapefile: lagoon_1879
			
		Polygons representing 1879 lagoon coverage area across field site. Small islands within lagoon environment are defined
		as lagoon area. 

	Shapefile: inland_marsh_1879
	
		Polygons representing 1840 inland marsh coverage area across field site. 	

		Historic map and GIS polygon discrepancy: Ponds within 1879 inland marsh area are counted as marsh (instead of lagoon) to align with the lower
		resolution 1840 maps, where ponds are not distinguished from marsh. 

	Shapefile: barrier_1934	
			
		Polygons representing 1934 barrier coverage area across field site. 

	Shapefile: backbarrier_marsh_1934
			
		Polygons representing 1934 backbarrier marsh coverage area across field site. Backbarrier marsh defined as marsh region 
		connected to the barrier. 

		Historic map and GIS polygon discrepancy: marsh region near Beach Haven, NJ removed from analysis to prevent marsh loss due to 
		development and therefore distort the calculation of the backbarrier marsh-lagoon boundary change during phase I. Beach Haven was the first significant 
		settlement at LBI that resulted in significant marsh loss due to development during the last stage of phase I. : lagoon_1934
			
		Polygons representing 1934 lagoon coverage area across field site. Small islands within lagoon environment are defined
		as lagoon area. 

	Shapefile: inland_marsh_1934
	
		Polygons representing 1840 inland marsh coverage area across field site. 	

	Shapefile: barrier_2022
			
		Polygons representing 2022 barrier coverage area across field site. 

	Shapefile: backbarrier_marsh_2022
			
		Polygons representing 2022 backbarrier marsh coverage area across field site. Backbarrier marsh defined as marsh region 
		connected to the barrier. 

	Shapefile: lagoon_2022
			
		Polygons representing 2022 lagoon coverage area across field site. Small islands within lagoon environment are defined
		as lagoon area. 

	Shapefile: inland_marsh_2022
	
		Polygons representing 2022 inland marsh coverage area across field site. 	

	Shapefile: Shoreline_1840, Shoreline_1879, Shoreline_1934, Shoreline_2022
	
		Lines defined by the eastern edge of the barrier representing that year's ocean shoreline.

	Shapefile: os_polygon_closing_lines 
	
		Lines added to form polygons between ocean shorelines of consecutive years.  

	Shapefile: os_1840_to_1879_change, os_1879_to_1934_change, os_1934-to_2022_change 
		
		Polygons representing landward and seaward ocean shoreline movement, bound by the associated year's shorelines and the 
		ocean shoreline polygon closing lines ("os_polygon_closing_lines). 


	Shapefile: 23Mareas_land_area.

		Polygons representing 2022 marsh and non-marsh regions of LBI. This shapefile was the source data for polygons representing
		the various 2022 environments. This shapefile was produced by processing the S57 format NOAA electronic navigation chart and
		exporting associated shapefiles.
		
Calculations
	
	See "environmental_boundary_change_calculations" spreadsheet in the "calculations" folder. 


Copyright 

	Data generated by this analysis is freely available @ https://github.com/JorgeMSU/LBI_Cross-shore_Barrier-Marsh-Lagoon. There is no warranty involved with the data generated by this analysis.
	Authors assume no liability involving any use of these data.


Contact info: Shane Nichols-O’Neill (nicholsones1@montclair.edu )
