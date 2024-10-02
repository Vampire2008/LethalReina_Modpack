param($mod)

if (!(Test-Path "$PSScriptRoot/$mod")) {
    Write-Error "Mod with name $mod not exists"
    exit 1
}

$outputFile = "$PSScriptRoot/LethalReina_Modpack_$mod.zip"

if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

Compress-Archive -Path ("$PSScriptRoot/$mod/*", "$PSScriptRoot/README.md"") -DestinationPath $outputFile
