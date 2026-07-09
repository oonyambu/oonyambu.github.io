# Render the Quarto site and copy the output to the repo root,
# where GitHub Pages serves it from (master branch, root folder).
# Usage:  .\publish.ps1        then review, git add -A, commit, push.

$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

quarto render
if ($LASTEXITCODE -ne 0) { throw "quarto render failed" }

Copy-Item -Recurse -Force _site\* .
Write-Host "Rendered site copied to repo root. Review, then commit and push."
