
user = lex
waittime = 10

test :
	sfdx force:apex:test:run -t Requirements.verifyMasterRollups -w $(waittime) -u $(user)

builder :
	sfdx force:apex:test:run -t Requirements.builder -w $(waittime) -u $(user)

md_setup :
	sfdx force:apex:execute -f ./apex/md_setup.apex -u $(user)

md_cleanup : 
	sfdx force:apex:execute -f ./apex/md_cleanup.apex -u $(user)
