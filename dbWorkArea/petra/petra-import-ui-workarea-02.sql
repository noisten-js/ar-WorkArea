USE EDW

--SELECT * FROM 

UPDATE EDW_Stage.Stage.Petra_Zdata 
	SET ROWHASH = hashbytes('SHA2_256', concat(Source,'|', CHGDATE,'|', concat(TEXT, ',JS'), '|', newid()))
	,TEXT = concat(TEXT, ',JS')
WHERE Project = 'WILLISTON BASIN' AND TEXT IS NOT NULL

SELECT * FROM EDW_Stage.Stage.Petra_Zdata WHERE Project = 'WILLISTON BASIN' AND TEXT IS NOT NULL