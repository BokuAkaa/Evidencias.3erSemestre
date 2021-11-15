function menú
{
  param (
    [string]$Title = "Bienvenido al Menú de Powershell."
  )
  cls
  Write-Host "==========$Title=========="

  Write-Host "1: Ver status del perfil."
  Write-Host "2: Cambiar el status del perfil."
  Write-Host "3: Ver Perfil de Red Actual."
  Write-Host "4: Cambiar Perfil de Red Actual."
  Write-Host "Q: Presione 'Q' para salir."
}

function Ver-StatusPerfil{  #1
	param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [string] $perfil) 
	$status = Get-NetFirewallProfile -Name $perfil 
    Write-Host "Opciones: 'Public' o 'Private"
	Write-Host "Perfil:" $perfil 
	if($status.enabled){ 
		Write-Host "Status: Activado" 
	} else{ 
		Write-Host "Status: Desactivado" 
	} 
} 

function Cambiar-StatusPerfil{  #2
	param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [string] $perfil) 
	$status = Get-NetFirewallProfile -Name $perfil 
	Write-Host "Perfil:" $perfil 
	if($status.enabled){ 
		Write-Host "Status actual: Activado" 
		$opc = Read-Host -Promt "Deseas desactivarlo? [Y] Si [N] No" 
		if ($opc -eq "Y"){ 
			Set-NetFirewallProfile -Name $perfil -Enabled False 
		} 
	} else{ 
		Write-Host "Status: Desactivado" 
		$opc = Read-Host -Promt "Deseas activarlo? [Y] Si [N] No" 
		if ($opc -eq "Y"){ 
			Write-Host "Activando perfil" 
			Set-NetFirewallProfile -Name $perfil -Enabled True 
		} 
	} 
	Ver-StatusPerfil -perfil $perfil 
}

function Ver-PerfilRedActual{  #3
	$perfilRed = Get-NetConnectionProfile 
	Write-Host "Nombre de red:" $perfilRed.Name 
	Write-Host "Perfil de red:" $perfilRed.NetworkCategory 
}

function Cambiar-PerfilRedActual{ #4
	$perfilRed = Get-NetConnectionProfile 
	if($perfilRed.NetworkCategory -eq "Public"){ 
		Write-Host "El perfil actual es público" 
		$opc = Read-Host -Prompt "Quieres cambiar a privado? [Y] Si [N] No" 
		if($opc -eq "Y"){ 
			Set-NetConnectionProfile -Name $perfilRed.Name -NetworkCategory Private 
			Write-Host "Perfil cambiado" 
		} 
	} else{ 
		Write-Host "El perfil actual es privado" 
		$opc = Read-Host -Prompt "Quieres cambiar a público? [Y] Si [N] No" 
		if($opc -eq "Y"){ 
			Set-NetConnectionProfile -Name $perfilRed.Name -NetworkCategory Public
			Write-Host "Perfil cambiado" 
		} 
	} 







