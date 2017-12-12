## Update UnstableFlag

write-host $env:BUILD_SOURCEBRANCHNAME
write-host $env:BUILD_SOURCEBRANCH

$version = ""

if ($env:BUILD_SOURCEBRANCH -like "refs/pull*"){
 $version = "beta"
 Write-Host "Entered here: beta"
}
elseif($env:BUILD_SOURCEBRANCHNAME -ne "master")
{
 $version = "alpha"
 Write-Host "Entered here: alpha"
}

Write-Output ("##vso[task.setvariable variable=UnstableFlag;]$version")
Write-Output "Env variable UnstableFlag: $Env:UnstableFlag" -Verbose
Write-Output "Local variable UnstableFlag: $version"
