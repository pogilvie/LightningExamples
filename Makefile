
user = lex
waittime = 10

test :
	sfdx force:apex:test:run -t Requirements.verifyMasterRollups -w $(waittime) -u $(user)

builder :
	sfdx force:apex:test:run -t Requirements.builder -w $(waittime) -u $(user)

setup :
	sfdx force:apex:execute -f ./apex/md_setup.apex -u $(user)

cleanup : 
	sfdx force:apex:execute -f ./apex/md_cleanup.apex -u $(user)

listComponents :
	sfdx force:data:soql:query -q 'select Id, DeveloperName from AuraDefinitionBundle' -u $(user)
