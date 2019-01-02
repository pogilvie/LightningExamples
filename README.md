# Lightning Examples

## Dev, Build and Test
- clone: git clone https://github.com/pogilvie/LightningExamples.git
- cd LightningExamples/
- sfdx force:org:create -s -a lex edition=enterprise
- sfdx force:source:push

## Does lightning data service track changes on a master record's rollup up summary fields?
- sfdx force:org:push
- make md_setup
- navigate to the 'Masters' tab
- finding: recordUpdated events are not generated for changes to rollup summary fields

