# Get-ChildItem -Path "D:\vscode_kit\my_projects\powershell" -File -Recurse



foreach ($filename in Get-ChildItem "*.ps1"){
    echo "$filename"
}
echo "`nProgramme Completed......"