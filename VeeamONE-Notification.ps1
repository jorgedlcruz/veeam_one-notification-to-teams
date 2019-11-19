param([string]$AlarmName,[string]$NodeName,[string]$Summary,[string]$Time,[string]$Status,[string]$OldStatus,[string]$ID)
<#
        .SYNOPSIS
        Veeam ONE Notification to Microsoft Teams
  
        .DESCRIPTION
        Simple Script which will send Veeam ONE Notifications to a Microsoft Teams Channel
	
        .Notes
        NAME:  VeeamONE-Notification.ps1
        LASTEDIT: 19/11/2019
        VERSION: 0.1
        KEYWORDS: Veeam, Teams
   
        .Link
        https://www.jorgedelacruz.es
    
 #>

$uri = "https://outlook.office.com/webhook/714f2dd0-2c93-49da-b9bb-6223c2bbe5e0@a51ea1e1-9b68-496e-8953-95ef2a1a38f5/IncomingWebhook/832fd5d6fd4540359f12b2f584f32279/291b10fd-bb83-4e51-9365-302f403234a8"

$body = ConvertTo-JSON @{
    text = "[$($ID)] Alarm - $($AlarmName) for $($NodeName) has been changed to $($Status) (previous state: $($OldStatus))"
}

Invoke-RestMethod -uri $uri -Method Post -body $body -ContentType 'application/json'