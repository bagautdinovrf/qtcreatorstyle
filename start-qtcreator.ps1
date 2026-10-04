param(
  [string]$QtCreatorPath,
  [string[]]$QtCreatorArguments = @()
)

$ErrorActionPreference = 'Stop'

if (-not $QtCreatorPath) {
  $creatorCommand = Get-Command qtcreator.exe -CommandType Application -ErrorAction SilentlyContinue |
    Select-Object -First 1
  if ($creatorCommand) {
    $QtCreatorPath = $creatorCommand.Source
  } else {
    $creatorCandidates = @(
      'C:\Qt\Tools\QtCreator\bin\qtcreator.exe',
      (Join-Path $env:ProgramFiles 'Qt Creator\bin\qtcreator.exe')
    )
    $QtCreatorPath = $creatorCandidates |
      Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } |
      Select-Object -First 1
  }
}

if (-not $QtCreatorPath -or -not (Test-Path -LiteralPath $QtCreatorPath -PathType Leaf)) {
  throw 'Qt Creator was not found. Specify its executable with -QtCreatorPath.'
}

$creatorFile = Get-Item -LiteralPath $QtCreatorPath
if ($creatorFile.VersionInfo.ProductVersion -match '^(\d+)\.') {
  if ([int]$Matches[1] -lt 18) {
    throw 'File tabs require Qt Creator 18 or later.'
  }
}

$stylesheetPath = Join-Path $PSScriptRoot 'editor-tabs-light.qss'
if (-not (Test-Path -LiteralPath $stylesheetPath -PathType Leaf)) {
  throw "The tab stylesheet was not found: $stylesheetPath"
}

& $creatorFile.FullName '-stylesheet' $stylesheetPath @QtCreatorArguments
