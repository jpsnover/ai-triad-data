# Runner for the data-repo situation-BDI pre-commit check (t/3892).
#
# Loads ONLY the classifier and Get-SituationBdiViolationsFromJson -- never
# `Import-Module AITriad`, which costs 6-17 s per commit and drives --no-verify
# (t/3892#2). Both files arrive as copies of the code repo's origin/main blobs,
# extracted by the caller, so a stale or locally-edited code checkout can't
# change what the gate enforces.
#
# Exit codes: 0 = no violations, 1 = violations (printed), 2 = COULD NOT VERIFY.
# Any failure to load or parse is 2, never 0: an empty result must not read as a pass.
param(
    [Parameter(Mandatory)][string]$BaselinePath,
    [Parameter(Mandatory)][string]$CandidatePath,
    [Parameter(Mandatory)][string]$ClassifierPath,
    [Parameter(Mandatory)][string]$CheckerPath
)
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

try {
    . $ClassifierPath
    . $CheckerPath
    if (-not (Get-Command Get-SituationBdiViolationsFromJson -ErrorAction SilentlyContinue)) {
        throw 'Get-SituationBdiViolationsFromJson not defined after loading the checker'
    }
    # Read as text; the checker strips a leading U+FEFF itself (t/3901#2), so a
    # PowerShell-written (BOM'd) situations.json parses whichever way it arrives.
    $baseline  = if ((Get-Item -LiteralPath $BaselinePath).Length -gt 0) {
        [System.IO.File]::ReadAllText($BaselinePath)
    } else { '' }
    $candidate = [System.IO.File]::ReadAllText($CandidatePath)
    $violations = @(Get-SituationBdiViolationsFromJson -BaselineJson $baseline -CandidateJson $candidate)
}
catch {
    [Console]::Out.WriteLine("COULD-NOT-VERIFY`t$($_.Exception.Message)")
    exit 2
}

foreach ($v in $violations) {
    [Console]::Out.WriteLine("VIOLATION`t$($v.id)`t$($v.pov)`t$($v.reason)")
}
if ($violations.Count -gt 0) { exit 1 }
exit 0
