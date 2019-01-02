# Lightning Examples

## Dev, Build and Test
- clone: git clone https://github.com/pogilvie/LightningExamples.git
- cd LightningExamples/
- sfdx force:org:create -s -a lex edition=enterprise
- sfdx force:source:push

## Lightning Data Service and master record rollup up summary fields
- Rollup.cmp
- sfdx force:org:push
- make md_setup
- navigate to the 'Masters' tab
- finding: recordUpdated events are not generated for changes to rollup summary fields

## Native Lookups with <lightning:recordEditForm>
- RecordEditForm.cmp
- <lightning:inputField fieldName="AccountId" /> to implement a lookup field

