$outputFile = "$PSScriptRoot/LethalReina_Modpack.zip"

if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

Compress-Archive -Path ("$PSScriptRoot/package/*", "$PSScriptRoot/README.md", "$PSScriptRoot/CHANGELOG.md") -DestinationPath $outputFile
