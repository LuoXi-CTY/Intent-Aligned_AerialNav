$port = 8000

$pythonCommand = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCommand) {
  $pythonCommand = Get-Command py -ErrorAction SilentlyContinue
}

if (-not $pythonCommand) {
  Write-Host "Python was not found. Install Python first, then run: python -m http.server $port" -ForegroundColor Yellow
  exit 1
}

Write-Host "Starting local preview at http://localhost:$port" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server." -ForegroundColor Green

if ($pythonCommand.Name -eq "py.exe" -or $pythonCommand.Name -eq "py") {
  & $pythonCommand.Source -m http.server $port
} else {
  & $pythonCommand.Source -m http.server $port
}
