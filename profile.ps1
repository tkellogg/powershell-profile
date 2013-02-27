function global:UseMyServiceLayer() {
  Set-Item -path env:ENGINE_SERVER_ADDRESS -value "localhost"
  Set-Item -path env:ALTERYX_SERVICE_SECRET -value "C52F480118D34C3471E3BB14AD85BA8BC1D8398F"
  [Environment]::SetEnvironmentVariable("ENGINE_SERVER_ADDRESS", "localhost", [EnvironmentVariableTarget]::Machine)
  [Environment]::SetEnvironmentVariable("ALTERYX_SERVICE_SECRET", "C52F480118D34C3471E3BB14AD85BA8BC1D8398F", [EnvironmentVariableTarget]::Machine)
}

function global:UseCloudPerf() {
  Set-Item -path env:ENGINE_SERVER_ADDRESS -value "CloudPerf"
  Set-Item -path env:ALTERYX_SERVICE_SECRET -value "D68F63498FF2793E577A16D1F81055E82B8BAE0D"
  [Environment]::SetEnvironmentVariable("ENGINE_SERVER_ADDRESS", "CloudPerf", [EnvironmentVariableTarget]::Machine)
  [Environment]::SetEnvironmentVariable("ALTERYX_SERVICE_SECRET", "D68F63498FF2793E577A16D1F81055E82B8BAE0D", [EnvironmentVariableTarget]::Machine)
}

function global:Hogwarts() {
	Write-Host $Env:ALTERYX_SERVICE_SECRET
	Write-Host $Env:ENGINE_SERVER_ADDRESS
}


# Load Jump-Location profile
. 'W:\apps\Jump-Location\Load.ps1'

Set-Alias vim 'C:\Program Files (x86)\Vim\vim73\vim.exe'

function Edit-Profile() {
	vim $PROFILE.CurrentUserAllHosts
}

#region ----------- Beginning of PSCX 2.0 Initialization --------------------

Import-Module W:\apps\Pscx\Pscx.dll

# Import the Pscx.Deprecated module only if you need PSCX's Start-Process, 
# Select-Xml and Get-Random cmdlets instead of PowerShell's built-in version
# of these cmdlets.
#Import-Module Pscx.Deprecated 

#endregion -------- End of PSCX 2.0 Initialization --------------------------

Function Gitk([Parameter(ValueFromRemainingArguments=$true)] $args) {
	$argsAsString = $($args -join " ")
	Invoke-Expression "bash 'C:\Program Files (x86)\git\bin\gitk' $argsAsString"
}

Function Ack([Parameter(ValueFromRemainingArguments=$true)] $args) {
	$argsAsString = $($args -join " ")
	Invoke-Expression "perl '~\bin\ack' $argsAsString"
}

set-alias which Get-Command

# I asked a SO question about how to do `cmd && dependent-cmd` and the best answer
# is to use `-ErrorAction Stop`. Setting this var globally makes it so that this is
# the default behavior.  
# http://stackoverflow.com/questions/15101705/how-to-run-multiple-commands-on-success
$errorActionPreference = 'Stop'

