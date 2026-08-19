# donotpassgo
donotpassgo is a github/gitea action to run unit tests and standards/security checks for Go applications. donotpassgo supports running unit tests using the standard go library as well as support for Ginkgo. Static code analysis is ran using gosec and dependencies are scanned using govulncheck

## Inputs
|Input|Required|Values|Default|Description|
|-----|-----|-----|-----|-----|
|test-library|false|standard,ginkgo,none|none|unit testing library to use, tests are skipped if set to 'none'|
|test-version|false|any ginkgo version|latest|the version of the testing library to use (only ginkgo supported atm, value is ignored if using standard lib testing)|
|test-fail|false|yes,no|yes|does the job fail if unit tests fail|
|static|false|yes,no|yes|do static code checks run|
|static-fail|false|yes,no|yes|does the job fail if static code checks fail|
|vulnerability|false|yes,no|yes|do dependencies get scanned for vulnerabilities|
|vulnerability-fail|false|yes,no|yes|does the job fail if vulnerabilities are found|