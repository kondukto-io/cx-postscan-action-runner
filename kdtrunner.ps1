param( [string]$f = "f" )

$bytes = [System.IO.File]::ReadAllBytes($f)
$tmpf = New-TemporaryFile

[System.IO.File]::WriteAllBytes("$tmpf", $bytes[3..($bytes.length)])

[xml]$Data = Get-Content "$tmpf"
$project = $Data.CxXMLResults.ProjectName

cd "C:\Program Files\Checkmarx\Executables"
.\kdt.exe --host {host} --token {token} scan -p "$project" -t checkmarx -f "$tmpf" -b master --insecure --async

rm $tmpf
