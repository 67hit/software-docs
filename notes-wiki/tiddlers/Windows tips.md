## Don't display last user logon

Set the registry key: `DontDisplayLastUserName` to `0`

## Share directory from command line
### Add share
```
C:\>net share MyShare=C:\Dir1\Dir2 /grant:Everyone,full
```
### Delete share
```
C:\>net share MyShare /delete
```

## Disable customer experience program
### Steps
1. Start the control panel and click Action Center > Change Action Center settings.
1. Click Customer Experience Improvement Program settings.
1. Select No, I don't want to participate in the program and click Save changes.
1. Start the control panel and click Administrative Tools > Task Scheduler.
1. In the Task Scheduler (Local) pane of the Task Scheduler dialog box, expand the Task Scheduler Library > Microsoft > Windows nodes and open the Application Experience folder.
1. Disable the AITAgent and ProgramDataUpdater tasks.
1.  In the Task Scheduler Library > Microsoft > Windows node, open the Customer Experience Improvement Program folder.
1. Disable the Consolidator, KernelCEIPTask, and Use CEIP tasks.

### More info
* Windows Customer Experience Improvement Program and Resulting Internet Communication in Windows Vista

* https://technet.microsoft.com/en-us/library/cc766341(v=ws.10).aspx
  * Please note the section "Procedures for Controlling the Windows Customer Experience Improvement Program".

### Reference
Source: [here](https://social.technet.microsoft.com/Forums/windows/en-US/0439e00b-f44a-40ac-999c-e574cb575ba9/user-logoff-notification-for-customer-experience-improvement-program?forum=w7itprogeneral)

## Create SQL Server login
```sql
create login [domain\username] from windows
```

```sql
create user [domain\username] for login [domain\username] with default_schema=[dbo]
```

## nas4free not recognized
### Error message on nas4free
`smb_pwd_check_ntlmv1: incorrect password length`

### Setting on Windows 7
`Administrative Tools --> Local Security Policy`

Set LAN Manager Authentication Level as shown in figure:

![local-policy-for-nas4free](https://user-images.githubusercontent.com/80605254/212574910-922f7cb5-03c2-45d3-a74e-5ee4978635a1.png)

### Reference
Suggestion taken from [here](http://www.snbforums.com/threads/incorrect-password-length-in-logs.7850).

## Schedule Windows Defender Scans via Local Group Policy
Go to `Local Computer Policy > Computer Configuration > Administrative Templates> Windows Components > Microsoft Defender Antivirus > Scan`.  Useful configuration items:
* Scan removable drives
* Start the scheduled scan only when the computer is on but not in use
* Specify the scan type to use for a scheduled scan
* Specify the day of the week for a scheduled scan
* Specify the time for a daily quick scan
* Specify the time of day to run a scheduled scan

(*Source: [Schedule antivirus scans using Group Policy - Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/schedule-antivirus-scans-group-policy?view=o365-worldwide)*)
