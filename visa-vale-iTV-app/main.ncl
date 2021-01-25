<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main_visa-vale" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>	
		<!--REGIONS-->
		<regionBase>
			<region width="1024" height="768" id="rgTV">																				
				<region id="rgBase" zIndex="1" width="982" height="768" />
				<region id="rgScript" zIndex="2" width="982" height="768"/>
			</region>
		</regionBase>
		
		<!--DESCRIPTORS-->
		<descriptorBase>			
			<descriptor id="dcBase" region="rgBase"/>
			<descriptor id="dcScript" region="rgScript" focusIndex="1"/>														
		</descriptorBase>
			
		<!--CONNECTORS-->
		<connectorBase>
			<causalConnector id="lnkOnBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>	
			</causalConnector>				
			
			<causalConnector id="lnkOnEndStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="start"/>				
			</causalConnector>
			
		</connectorBase>				
	</head>

	<body>
		<port id="ptEntry" component="mdScript"/>
		
		<!-- MEDIAS -->	
		<media id="mdScript" src="scripts/main.lua" type="application/x-ginga-NCLua" descriptor="dcScript" />
		
		<media id="mdImgBase" src="media/ConsultaVisaVale-3.png" type="image/png" descriptor="dcBase"/>
		
		<!-- LINKS-->
		<link xconnector="lnkOnBeginStart">
			<bind component="mdScript" role="onBegin" />
			<bind component="mdImgBase" role="start" />			
		</link>	
	</body>
</ncl>