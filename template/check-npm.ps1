Write-Host ""
Write-Host "Checking if folder ""node_modules"" exists" -ForegroundColor Yellow
if ( -not (Test-Path -Path 'node_modules' -PathType Container) ) { 
   Write-Host "Node_modules folder is missing" -ForegroundColor Red -NoNewline 
   Write-Host " => Running"  -ForegroundColor White -NoNewline 
   Write-Host " ""npm install""" -ForegroundColor Green -NoNewline 
   Write-Host " &" -ForegroundColor White -NoNewline 
   Write-Host " ""npm install --save-dev check-dependencies""" -ForegroundColor Green -NoNewline 
   Write-Host " &" -ForegroundColor White -NoNewline 
   Write-Host " ""npm audit fix""" -ForegroundColor Green
   npm install
   npm install --save-dev check-dependencies
   npm audit fix
   return
}
Write-Host "Checking if npm package ""check-dependencies"" exists" -ForegroundColor Yellow
if ( -not (Test-Path -Path 'node_modules/check-dependencies' -PathType Container) ) {
   Write-Host "Package ""check-dependencies"" is not installed" -ForegroundColor Red -NoNewline 
   Write-Host " => Running" -ForegroundColor White -NoNewline 
   Write-Host " ""npm install --save-dev check-dependencies""" -ForegroundColor Green -NoNewline 
   Write-Host " &"   -ForegroundColor White -NoNewline 
   Write-Host " ""npm audit fix""" -ForegroundColor Green
   npm install --save-dev check-dependencies
   npm audit fix 
   return
}
else {
   Write-Host "Checking npm package dependencies in project" -ForegroundColor Yellow
   node node_modules/check-dependencies/bin/cli check-dependencies --install
   return
}