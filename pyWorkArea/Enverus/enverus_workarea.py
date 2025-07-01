import csv
import pyodbc
from jsutils import db_connect


def do_the_thing():
    fp = "C:/FileStore/temp/edw_stage.tables.csv"
    with open(fp, mode='r', newline='') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter="\t", quotechar='"')
        cols = next(csv_reader)
        data = [r for r in csv_reader]

    return {"cols": cols, "data": data}


def do_another_thing():
    src_srv = 'bi.drillinginfo.com'
    src_db = 'Drillinginfo_DIBI'
    src_user = 'env_2866'
    src_pw = 'YRwmC1u5XSDa'
    src_cn = db_connect(src_srv, src_db, src_user, src_pw)

    dst_srv = '127.0.0.1'
    dst_db = 'WorkArea'
    dst_cn = db_connect(dst_srv, dst_db)

    sql = (
        f"SELECT\n"
        f"     sel_name = CASE t1.name\n"
        f"              WHEN 'GEOMETRY' THEN concat(quotename(t0.name), ' = try_convert(VARBINARY(max),', quotename(t0.name),')')\n"
        f"              ELSE  quotename(t0.name)\n"
        f"           END\n"
        f"    ,name = quotename(t0.name)\n"
        f"FROM\n"
        f"   sys.columns t0\n"
        f"   INNER JOIN sys.types t1\n"
        f"      ON t0.user_type_id = t1.user_type_id\n"
        f"WHERE 1=1\n"
        f"    AND t0.object_id = object_id(?) "
        f"    AND t0.name NOT IN ('ETL_Load_Date')"
    )
    print(sql)

    param = ['dbo.Well']

    dst_cr = dst_cn.cursor()
    data = dst_cr.execute(sql, param).fetchall()
    sel_cols = ','.join([r.sel_name for r in data])
    cols = ','.join([r.name for r in data])
    qstr = ','.join(['?' for c in data])
    dst_cr.close()

    sql = (
        f'SELECT\n'
        f'  {sel_cols}\n'
        f'FROM\n'
        f'  env.Foundations_Wells\n'
        f'WHERE 1=1\n'
        f'  AND DeletedDate IS NULL\n'
        f'ORDER BY\n'
        f'  WellID, CompletionID\n'
        f'OFFSET 0 ROWS FETCH NEXT 100000 ROWS ONLY\n'
    )
    print(sql)

    src_cr = src_cn.cursor()
    data = src_cr.execute(sql).fetchall()

    sql = f'INSERT INTO dbo.Well ({cols}) VALUES ({qstr})'
    print(sql)

    dst_cr = dst_cn.cursor()
    dst_cr.fast_executemany = True
    dst_cr.executemany(sql, data)
    dst_cn.commit()

    return data, dst_cn, cols, qstr


# From the command history; this is the working session I had to figure out how to transfer binary data as
# a 64bit encoded string in JSON so that GEOMETRY data can be passed to a 'Save' proc as a JSON string
#
# from workarea import do_another_thing
# data, cn, cols, qstr = do_another_thing()
# len(qstr.split(','))
# from workarea import do_another_thing
# data, cn, cols, qstr = do_another_thing()
# print(len(qstr.split(',')))
# import base64
# import os
# import re
# sp, sd = ".*/.(jpg|bmp|png)", "C:\\"
# x = 'This is my file.png'
# re.search(sp, x)
# sp, sd = ".*\.(jpg|bmp|png)", "C:\\"
# sp, sd = r".*\.(jpg|bmp|png)", "C:\\"
# matches = [os.path.join(entry[0], file) for entry in os.walk(sd) for file in entry[2] if re.search(sp, file.lower())]
# images = []
# for m in matches:
#     with open(m, mode='rb') as f:
#         img_data = f.read()
#         img_data = base64.b64encode(img_data).decode('utf-8')
#     images.append({"fp": m, "data": img_data})
#
# with open("C:\\FileStore\\Temp\\tst.png", 'wb') as f:
#     png_data = base64.decodestring(images[0]['data'])
#     f.write(png_data)
#
# with open("C:\\FileStore\\Temp\\tst.png", 'wb') as f:
#     png_data = base64.b64decode(images[0]['data'])
#     f.write(png_data)
#
# from EnverusSync import db_connect
# cn = db_cn
# from workarea import do_another_thing
# x = do_another_thing()
# cr.execute("SELECT * FROM WorkArea.dbo.Well")
# cr.execute("SELECT [Abstract],[AcidVolume_BBL],[AlternativeWellName],[API_UWI],[API_UWI_Unformatted],[API_UWI_12],[API_UWI_12_Unformatted],[API_UWI_14],[API_UWI_14_Unformatted],[AverageStageSpacing_FT],[AvgBreakdownPressure_PSI],[AvgClusterSpacing_FT],[AvgClusterSpacingPerStage_FT],[AvgFluidPerCluster_BBL],[AvgFluidPerShot_BBL],[AvgFluidPerStage_BBL],[AvgFracGradient_PSIPerFT],[AvgISIP_PSI],[AvgMillTime_Min],[AvgPortSleeveOpeningPressure_PSI],[AvgProppantPerCluster_LBS],[AvgProppantPerShot_LBS],[AvgProppantPerStage_LBS],[AvgShotsPerCluster],[AvgShotsPerFT],[AvgTreatmentPressure_PSI],[AvgTreatmentRate_BBLPerMin],[Biocide_LBS],[Block],[Bottom_Hole_Temp_DEGF],[BottomHoleAge],[BottomHoleFormationName],[BottomHoleLithology],[Breaker_LBS],[Buffer_LBS],[CasingPressure_PSI],[ChokeSize_64IN],[ClayControl_LBS],[ClustersPer1000FT],[ClustersPerStage],[CompletionDate],[CompletionDesign],[CompletionID],[CompletionNumber],[CompletionTime_DAYS],[Contract],[CoordinateQuality],[CoordinateSource],[Country],[County],[CrossLinker_LBS],[CumGas_MCF],[CumGas_MCFPer1000FT],[CumOil_BBL],[CumOil_BBLPer1000FT],[CumProd_BOE],[CumProd_BOEPer1000FT],[CumProd_MCFE],[CumProd_MCFEPer1000FT],[CumulativeSOR],[CumWater_BBL],[DeletedDate],[DevelopmentFlag],[DiscoverMagnitudeComments],[DiscoveryType],[District],[Diverter_LBS],[DrillingEndDate],[DrillingTDDate],[DrillingTDDateQualifier],[ElevationGL_FT],[ElevationKB_FT],[EndDateQualifier],[Energizer_LBS],[ENVBasin],[ENVCompInsertedDate],[ENVElevationGL_FT],[ENVElevationGLSource],[ENVElevationKB_FT],[ENVElevationKBSource],[ENVFluidType],[ENVFracJobType],[ENVInterval],[ENVIntervalSource],[Environment],[ENVOperator],[ENVPeerGroup],[ENVPlay],[ENVProducingMethod],[ENVProdWellType],[ENVProppantBrand],[ENVProppantType],[ENVRegion],[ENVStockExchange],[ENVSubPlay],[ENVTicker],[ENVWellboreType],[ENVWellGrouping],[ENVWellServiceProvider],[ENVWellStatus],[ENVWellType],[ExplorationFlag],[Field],[First3MonthFlaredGas_MCF],[First3MonthGas_MCF],[First3MonthGas_MCFPer1000FT],[First3MonthOil_BBL],[First3MonthOil_BBLPer1000FT],[First3MonthProd_BOE],[First3MonthProd_BOEPer1000FT],[First3MonthProd_MCFE],[First3MonthProd_MCFEPer1000FT],[First3MonthWater_BBL],[First6MonthFlaredGas_MCF],[First6MonthGas_MCF],[First6MonthGas_MCFPer1000FT],[First6MonthOil_BBL],[First6MonthOil_BBLPer1000FT],[First6MonthProd_BOE],[First6MonthProd_BOEPer1000FT],[First6MonthProd_MCFE],[First6MonthProd_MCFEPer1000FT],[First6MonthWater_BBL],[First9MonthFlaredGas_MCF],[First9MonthGas_MCF],[First9MonthGas_MCFPer1000FT],[First9MonthOil_BBL],[First9MonthOil_BBLPer1000FT],[First9MonthProd_BOE],[First9MonthProd_BOEPer1000FT],[First9MonthProd_MCFE],[First9MonthProd_MCFEPer1000FT],[First9MonthWater_BBL],[First12MonthFlaredGas_MCF],[First12MonthGas_MCF],[First12MonthGas_MCFPer1000FT],[First12MonthOil_BBL],[First12MonthOil_BBLPer1000FT],[First12MonthProd_BOE],[First12MonthProd_BOEPer1000FT],[First12MonthProd_MCFE],[First12MonthProd_MCFEPer1000FT],[First12MonthWater_BBL],[First36MonthGas_MCF],[First36MonthGas_MCFPer1000FT],[First36MonthOil_BBL],[First36MonthOil_BBLPer1000FT],[First36MonthProd_BOE],[First36MonthProd_BOEPer1000FT],[First36MonthProd_MCFE],[First36MonthProd_MCFEPer1000FT],[First36MonthWater_BBL],[First36MonthWaterProductionBBLPer1000Ft],[FirstDay],[FirstProdDate],[FirstProdMonth],[FirstProdQuarter],[FirstProdYear],[FlaredGasRatio],[FlowingTubingPressure_PSI],[FluidIntensity_BBLPerFT],[Formation],[FracRigOnsiteDate],[FracRigReleaseDate],[FracStages],[FrictionReducer_LBS],[GasGravity_SG],[GasTestRate_MCFPerDAY],[GasTestRate_MCFPerDAYPer1000FT],[GellingAgent_LBS],[GeneralComments],[GeomBHL_Point] = try_convert(VARBINARY(max),[GeomBHL_Point]),[GeomSHL_Point] = try_convert(VARBINARY(max),[GeomSHL_Point]),[GOR_ScfPerBbl],[GovernmentWellId],[InitialOperator],[IronControl_LBS],[Last3MonthISOR],[Last12MonthGasProduction_MCF],[Last12MonthOilProduction_BBL],[Last12MonthProduction_BOE],[Last12MonthWaterProduction_BBL],[LastMonthFlaredGas_MCF],[LastMonthGasProduction_MCF],[LastMonthLiquidsProduction_BBL],[LastMonthWaterProduction_BBL],[LastProducingMonth],[LateralLength_FT],[LateralLine] = try_convert(VARBINARY(max),[LateralLine]),[Latitude],[Latitude_BH],[Lease],[LeaseName],[Longitude],[Longitude_BH],[LowerPerf_FT],[MD_FT],[MonthsToPeakProduction],[NumberOfStrings],[ObjectiveAge],[ObjectiveLithology],[OffConfidentialDate],[OilGravity_API],[OilProdPriorTest_BBL],[OilTestMethodName],[OilTestRate_BBLPerDAY],[OilTestRate_BBLPerDAYPer1000FT],[OnConfidential],[OnOffshore],[PeakFlaredGas_MCF],[PeakGas_MCF],[PeakGas_MCFPer1000FT],[PeakOil_BBL],[PeakOil_BBLPer1000FT],[PeakProd_BOE],[PeakProd_BOEPer1000FT],[PeakProd_MCFE],[PeakProd_MCFEPer1000FT],[PeakProductionDate],[PeakWater_BBL],[PerfInterval_FT],[PermitApprovedDate],[PermitSubmittedDate],[PermitToSpud_DAYS],[Platform],[PlugbackMeasuredDepth_FT],[PlugbackTrueVerticalDepth_FT],[PlugDate],[Proppant_LBS],[ProppantIntensity_LBSPerFT],[ProppantLoading_LBSPerGAL],[Range],[RawOperator],[RawVintage],[ResourceMagnitude],[ResourceMagnitudeReviewDate],[ResourceSourceQualifier],[ResourceVolumeGasBcf],[ResourceVolumeLiquidsMMb],[RigReleaseDate],[ScaleInhibitor_LBS],[Section],[Section_Township_Range],[ShotsPer1000FT],[ShotsPerStage],[ShutInPressure_PSI],[SoakTime_DAYS],[SpudDate],[SpudDateQualifier],[SpudDateSource],[SpudToCompletion_DAYS],[SpudToRigRelease_DAYS],[SpudToSales_DAYS],[StateFileNumber],[StateProvince],[StateWellType],[StimulatedStages],[SurfaceLatLongSource],[Surfactant_LBS],[TestComments],[TestDate],[TestRate_BOEPerDAY],[TestRate_BOEPerDAYPer1000FT],[TestRate_MCFEPerDAY],[TestRate_MCFEPerDAYPer1000FT],[TestWHLiquids_PCT],[TotalClusters],[TotalFluidPumped_BBL],[TotalProducingMonths],[TotalShots],[TotalWaterPumped_GAL],[Township],[Trajectory],[TVD_FT],[UnconventionalFlag],[UnconventionalType],[Unit_Name],[UpdatedDate],[UpperPerf_FT],[Vintage],[WaterDepth],[WaterIntensity_GALPerFT],[WaterSaturation_PCT],[WaterTestRate_BBLPerDAY],[WaterTestRate_BBLPerDAYPer1000FT],[WellboreID],[WellID],[WellName],[WellNumber],[WellPadDirection],[WellPadID],[WellSymbols],[WHLiquids_PCT] FROM WorkArea.dbo.Well")
# data = cr.fetchall()
# data[0].cursor_description
# bd = base64.encode(data[0].GeomBHL_Point).decode('utf-8')
# bd = base64.b64decode(data[0].GeomBHL_Point).decode('utf-8')
# base64.b64decode(data[0].GeomBHL_Point)
# base64.b64encode(data[0].GeomBHL_Point).decode('utf-8')
# data[0].GeomBHL_Point
# str(data[0].GeomBHL_Point)
# mydata = [{"mydata": data[0].GeomBHL_Point}]
# import json
# mydata = [{"mydata": str(data[0].GeomBHL_Point)}]
# sql = 'EXEC dbo.myProc @data = ?'
# cr.execute(sql, [jmydata])
# cr.close()
# cn.close()
# cn = db_connect('(local', 'WorkArea')
# cn = db_connect('(local)', 'WorkArea')
# cr = cn.cursor()
# mydata = [{"mydata": base64.b64encode(data[0].GeomBHL_Point).decode('utf-8')}]
# type(data[0].GeomBHL_Point)
# mydata = [{"WellID": data[0].WellID, "mydata": base64.b64encode(data[0].GeomBHL_Point).decode('utf-8')}]
# jmydata = json.dumps(mydata)
# cr.execute(sql, jmydata)
# cr.commit()
#
#
# -----------------------------------------------------------------------------------
# next is the SQL CODE
# -----------------------------------------------------------------------------------
# USE WorkArea
# DROP TABLE IF EXISTS dbo.MyTest
# DROP PROCEDURE IF EXISTS dbo.myProc
#
# CREATE TABLE dbo.MyTest (WellID BIGINT NOT NULL, mydata GEOMETRY NULL)
#
# GO
#
# CREATE PROCEDURE dbo.myProc (@data VARCHAR(max))
# AS
# BEGIN
# 	INSERT INTO dbo.MyTest (
# 	    WellID, mydata
# 	)
# 	SELECT WellID, mydata FROM openjson(@data) WITH (WellID BIGINT, mydata VARBINARY(max))
# END
#
# GO
#
# SELECT * FROM dbo.MyTest
# UNION ALL SELECT TOP 10 WellID, GeomBHL_Point FROM dbo.Well

# import traceback
# import datetime
# import pyodbc
#
#
# collectors = [
#     {
#         "batch_size": 100000,
#         "src_name": 'ENV.Foundations_ActiveRigs',
#         "keys": ['WellID', 'ENVRigID'],
#         "dst_name": 'Stage_Persistent.Enverus_Foundations_ActiveRigs',
#     },
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_DrillStemTests', "keys": ['WellID', 'DSTID', 'FlowID, RecoveryID'],"dst_name": 'Stage_Persistent.Enverus_Foundations_DrillStemTests'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_LandtracLeases', "keys": ['LeaseID'],"dst_name": 'Stage_Persistent.Enverus_Foundations_LandtracLeases'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_LandtracUnits', "keys": ['API_UWI_Unformatted'],"dst_name": 'Stage_Persistent.Enverus_Foundations_LandtracUnits'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_Wells', "keys": ['CompletionID', 'WellID'], "dst_name": 'Stage_Persistent.Enverus_Foundations_Wells'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_Permits', "keys": ['PermitID'],"dst_name": 'Stage_Persistent.Enverus_Foundations_Permits'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_Production', "keys": ['ProductionID'], "dst_name": 'Stage_Persistent.Enverus_Foundations_Production'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_FullDirectionalSurvey', "keys": ['API_UWI_12_Unformatted', 'StationNumber'],"dst_name": 'Stage_Persistent.Enverus_Foundations_FullDirectionalSurvey'},
#     {"batch_size": 100000, "src_name": 'ENV.Foundations_Rigs', "keys": ['CompletionID', 'WellID'], "dst_name": 'Stage_Persistent.Enverus_Foundations_Rigs'},
# ]
#
#
# def process_collectors(src_cn, dest_cn):
#     src_datas = []
#
#     for collector in collectors:
#         sql = (
#             f"SELECT\n"
#             f"    name = CASE t1.name\n"
#             f"              WHEN 'GEOMETRY' THEN concat(quotename(t0.name), ' = try_convert(VARBINARY(max),', quotename(t0.name),')')\n"
#             f"              ELSE  quotename(t0.name)\n"
#             f"           END\n"
#             f"FROM\n"
#             f"   sys.columns t0\n"
#             f"   INNER JOIN sys.types t1\n"
#             f"      ON t0.user_type_id = t1.user_type_id\n"
#             f"WHERE 1=1\n"
#             f"    AND t0.object_id = object_id(?) "
#             f"    AND t0.name NOT IN ('ETL_Load_Date')"
#         )
#
#         with dest_cn.cursor() as cr:
#             cr.execute(sql, [collector.get("dst_name")])
#             dst_data = cr.fetchall()
#
#         batch_index = 0
#         batch_size = collector.get('batch_size')
#         is_empty = False
#
#         cols = ','.join([r.name for r in dst_data])
#         print(cols)
#
#         while is_empty is False:
#             src_sql = (
#                 f"SELECT\n"
#                 f"  {cols}\n"
#                 f"FROM\n"
#                 f"  {collector.get('src_name')}\n"
#                 f"ORDER BY\n"
#                 f"  {','.join(collector.get('keys'))}\n"
#                 f"OFFSET {batch_index} ROWS FETCH NEXT {batch_size} ROWS ONLY\n"
#             )
#             print(src_sql)
#
#             try:
#                 dts = datetime.datetime.now()
#                 src_cr = src_cn.cursor()
#                 src_data = src_cr.execute(src_sql).fetchall()
#                 dte = datetime.datetime.now()
#                 dur = dte - dts
#                 print(dur)
#
#             except Exception:
#                 tb = traceback.format_exc()
#                 print(tb)
#
#             src_datas.append(src_data)
#             batch_index += batch_size
#             print(batch_index)
#
#             if batch_index > 500000:
#                 break
#
#     return src_datas
#
#
# def db_connect(
#     server: str,
#     database: str,
#     login_name: str = None,
#     password: str = None,
#     context: str = 'js.utils',
#     driver_ver: int = 17
# ):
#     """
#     desc:   Connects to a sql server database server using the specified credentials or Windows Integrated if no
#             username and password specified
#
#     params: server      network name, network alias, IPv4 or IPv6 network address of the SQL Server optionally
#                         including the port
#
#             database    Name of the database the connection will be made to. The user must have connect permissions
#                         in the database specified.
#
#             login_name  The login name of SQL Server Login configured on the server being connected to
#
#             password    The password of the specified login.
#
#             context     Is the name of the application connecting to SQL Server. This value is used in the APP
#                         parameter of the connection string. This will be the value found in program_name in the
#                         sys.dm_exec_sessions dynamic management view.
#
#             driver_ver  The version of the driver to be used. This has only been tested with 13 and 17. The
#                         default is 17.
#
#     return: pyodbc.Connection
#
#     notes:  If login_name or password are empty or set to None then the connection is established using Integrated
#             Security set to True
#     """
#     database = 'master' if database is None or database == '' else database
#     connection_string = f'DRIVER={{ODBC Driver {driver_ver} for SQL Server}};' \
#                         f'SERVER={server};' \
#                         f'DATABASE={database};' \
#                         f'APP={context};'
#
#     connection_string += 'Trusted_Connection=yes;' \
#         if login_name is None or password is None or login_name == '' or password == '' \
#         else f'UID={login_name};PWD={password}'
#
#     return pyodbc.connect(connection_string)
#
#
# """ This can eventually be changed to Collector object and stored in a config file/db-table
# from dataclasses import dataclass
#
#
# @dataclass
# class Collector:
#     source_object: str = None
#     dest_object: str = None
#     batch_size: int = 100000
#
#     source_cn: pyodbc.Connection = None
#     source_server: str = None
#     source_database: str = None
#     source_login: str = None
#     source_pw: str = None
#
#     dest_cn: pyodbc.Connection = None
#     dest_server: str = None
#     dest_database: str = None
#     dest_login: str = None
#     dest_pw: str = None
#
#     column_list: list = None
#     source_keys: list = None
#
#     def reset_connection(self):
#         if self.source_object is None:
#             raise ValueError("A value must be specified for source_object")
#
#         if self.dest_object is None:
#             raise ValueError("A value must be specified for dest_object")
#
#         if self.source_server is not None and self.source_database is not None:
#             self.source_cn = db_connect(self.source_server, self.source_database, self.source_login, self.source_pw)
#
#         if self.dest_server is not None and self.dest_database is not None:
#             self.dest_cn = db_connect(self.dest_server, self.dest_database, self.dest_login, self.dest_pw)
#
#         if self.dest_cn is not None:
#             # Get column list
#             sql = (
#                 f"SELECT\n"
#                 f"    name = CASE t1.name\n"
#                 f"              WHEN 'GEOMETRY' THEN concat(quotename(t0.name), ' = try_convert(VARBINARY(max),', quotename(t0.name),')')\n"
#                 f"              ELSE  quotename(t0.name)\n"
#                 f"           END\n"
#                 f"FROM\n"
#                 f"   sys.columns t0\n"
#                 f"   INNER JOIN sys.types t1\n"
#                 f"      ON t0.user_type_id = t1.user_type_id\n"
#                 f"WHERE 1=1\n"
#                 f"    AND t0.object_id = object_id(?)\n"
#                 f"    AND t0.name NOT IN ('ETL_Load_Date')\n"
#             )
#
#             with self.dest_cn.cursor() as cr:
#                 data = cr.execute(sql, [self.dest_object]).fetchall()
#                 self.column_list = [r.name for r in data]
#
#             # Get key columns
#             sql = (
#                 f"SELECT\n"
#                 f"	  t2.name\n"
#                 f"FROM\n"
#                 f"	 sys.indexes t0\n"
#
#                 f"	 INNER JOIN sys.index_columns t1\n"
#                 f"	    ON t0.object_id = t1.object_id\n"
#                 f"	    AND t0.index_id = t1.index_id\n"
#
#                 f"	 INNER JOIN sys.columns t2\n"
#                 f"	    ON t1.object_id = t2.object_id\n"
#                 f"	    AND t1.column_id = t2.column_id\n"
#                 f"WHERE 1=1\n"
#                 f"	 AND t0.is_primary_key = 1\n"
#                 f"	 AND t0.object_id = object_id(?)\n"
#             )
#
#             with self.dest_cn.cursor() as cr:
#                 data = cr.execute(sql, [self.dest_object]).fetchall()
#                 self.source_keys = [r.name for r in data]
#
#     def collect_data(self):
#         pass
#         # Add code to gather data in batches and save to db
# """
