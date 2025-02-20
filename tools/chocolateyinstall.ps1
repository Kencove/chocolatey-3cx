﻿$ErrorActionPreference = 'Stop';
$fullPackage = "3CXPhoneforWindows16.msi"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads-global.3cx.com/downloads/' + $fullPackage

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'msi'
    url            = $url
    softwareName   = '3CX*'
    checksum       = 'd8e563b9591282986d493a60dda0a5311b94b1dd61aad01b50df674b48207485'
    checksumType   = 'sha256'
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
