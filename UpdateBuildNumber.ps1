## Update Build Number

write-host $env:BUILD_SOURCEBRANCHNAME
write-host $env:BUILD_SOURCEBRANCH

$version = ""

if ($env:BUILD_SOURCEBRANCH -like "refs/pull*") {
 $version = "beta"
 Write-Output ("##vso[build.updatebuildnumber]" + $env:BUILD_BUILDNUMBER+"-$version")
 Write-Host "Entered here: beta"
}
elseif($env:BUILD_SOURCEBRANCHNAME -ne "master"){
 $version = "alpha"
 Write-Output ("##vso[build.updatebuildnumber]" + $env:BUILD_BUILDNUMBER+"-$version")
 Write-Host "Entered here: alpha"
}