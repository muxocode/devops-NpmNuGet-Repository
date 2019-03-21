$linuxfile = import-csv .env -Delimiter '=' -Header Var,Value | Where-Object {$_.Var -like 'URL*'}
$baseDir = ($linuxfile | Where-Object {$_.Var -like 'URL_BASE'} | Select-Object -Property Value).Value
$ArrayDir= ($linuxfile | Where-Object {$_.Var -notlike 'URL_BASE'} | Select-Object -Property Value).Value

Write-Host "Montando el entorno..."
Write-Host "Puede que tarde unos minutos, ten paciencia"
Write-Host ""
Write-Host ""

for($i=0; $i -lt $ArrayDir.Count; $i++){
    $dir = "$($baseDir)\$($ArrayDir.Get($i))"
    if ( !( Test-Path $dir -PathType Any ) ) 
    { 
        mkdir $dir
        Write-Host "Creado el directorio " + $dir
    }
}

#Esto es inevitable, ya que COPY no funciona
$verdaccio = ($linuxfile | Where-Object {$_.Var -like 'URL_NPM_CONF'} | Select-Object -Property Value).Value
Copy-Item ".\npm\config.yaml" -Destination "$($baseDir)\$($verdaccio)"

Write-Host ""
Write-Host ""
Write-Host "The code be with you"
Write-Host "  -- MuxoCode --  "

Start-Sleep -s 10
docker-compose up --build

