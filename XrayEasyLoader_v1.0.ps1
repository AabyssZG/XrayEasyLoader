$name = Read-Host '请输入目标地址(不带http://)'
$httpsq = "https://"
$httpq = "http://"
$ws = New-Object -ComObject WScript.Shell  
$wsr = $ws.popup("目标网站是否有SSL证书（https://）？",0,"请选择",4 + 64)
if ($wsr -eq 6){$choose = $httpsq} else{$choose = $httpq}
$urlname = $choose + $name + "/"
./Xray webscan --basic-crawler $urlname --html-output out.html
$Ubakdate = "{0:yyyy}" -f (Get-Date)
$Filename = $name + "_" + $Ubakdate + "年"
$Ubakdate = "{0:MM}" -f (Get-Date)
$Filename = $Filename + $Ubakdate + "月"
$Ubakdate = "{0:dd}" -f (Get-Date)
$Filename = $Filename + $Ubakdate + "日"
$Ubakdate = "{0:HH}" -f (Get-Date)
$Filename = $Filename + $Ubakdate + "时"
$Ubakdate = "{0:mm}" -f (Get-Date)
$Filename = $Filename + $Ubakdate + "分.html"
$End = $Filename -replace '[:]','_'
rename-Item out.html -NewName $End
