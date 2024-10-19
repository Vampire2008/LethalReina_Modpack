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

$manifest = Get-Content "$PSScriptRoot/$mod/manifest.json" -Raw | ConvertFrom-Json
$dependencies = Get-Content "$PSScriptRoot/common/base-dependencies.json" -Raw | ConvertFrom-Json

$manifest.dependencies += $dependencies
ConvertTo-Json $manifest | Out-File "$PSScriptRoot/$mod/files/manifest.json"

Compress-Archive -Path ("$PSScriptRoot/$mod/files/*", "$PSScriptRoot/common/files/*") -DestinationPath $outputFile
