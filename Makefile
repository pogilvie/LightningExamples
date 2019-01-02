
user = lex
waittime = 10

test :
	sfdx force:apex:test:run -t Requirements.verifyMasterRollups -w $(waittime) -u $(user)
