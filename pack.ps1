param($mod)

if (!(Test-Path "$PSScriptRoot/dist")) {
    New-Item -Path "$PSScriptRoot/dist" -ItemType Directory
}

if (!(Test-Path "$PSScriptRoot/$mod")) {
    Write-Error "Mod with name $mod not exists"
    exit 1
}

$outputFile = "$PSScriptRoot/dist/LethalReina_Modpack_$mod.zip"

if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

Compress-Archive -Path ("$PSScriptRoot/$mod/*") -DestinationPath $outputFile
