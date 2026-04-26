param(
  [Parameter(Mandatory = $true, Position = 0)]
  [string]$InputPath,

  [Parameter(Position = 1)]
  [string]$OutputDir = "",

  [string]$AudiverisPath = "C:\Program Files\Audiveris\Audiveris.exe"
)

$ErrorActionPreference = "Stop"

$resolvedInput = Resolve-Path -LiteralPath $InputPath

if (-not (Test-Path -LiteralPath $AudiverisPath)) {
  throw "Audiveris was not found at: $AudiverisPath"
}

if ([string]::IsNullOrWhiteSpace($OutputDir)) {
  $OutputDir = Join-Path -Path (Split-Path -Parent $resolvedInput) -ChildPath "audiveris-output"
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

Write-Host "Input:  $resolvedInput"
Write-Host "Output: $OutputDir"
Write-Host "Running Audiveris..."

& $AudiverisPath -batch -transcribe -export -output $OutputDir -- $resolvedInput

if ($LASTEXITCODE -ne 0) {
  throw "Audiveris failed with exit code $LASTEXITCODE"
}

$outputs = Get-ChildItem -LiteralPath $OutputDir -Recurse -File -Include *.mxl, *.musicxml, *.xml |
  Sort-Object LastWriteTime -Descending

if (-not $outputs) {
  Write-Warning "Audiveris finished, but no MusicXML/MXL file was found in the output folder."
  exit 0
}

Write-Host ""
Write-Host "Latest converted file:"
Write-Host $outputs[0].FullName
