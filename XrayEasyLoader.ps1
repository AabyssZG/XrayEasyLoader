$name = Read-Host '请输入网站地址'
$name = $name.replace('http://','')
$name = $name.replace('https://','')
$httpsq = "https://"
$httpq = "http://"
$ws = New-Object -ComObject WScript.Shell  
$wsr = $ws.popup("网站是否有SSL证书（https://）？",0,"请选择",4 + 64)
if ($wsr -eq 6){$choose = $httpsq} else{$choose = $httpq}
$urlname = $choose + $name + "/"
./Xray webscan --basic-crawler $urlname --html-output output.html
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
$End = $End.replace('/','-')
if(Test-Path output.html){
Write-Output "[+] 对于目标的扫描发现可利用点，正在导出报告并重命名"
rename-Item output.html -NewName $End
cmd /c "pause"
}
Else{
Write-Output "[-] 对于目标的扫描并未发现漏洞，无导出报告"
cmd /c "pause"
}
