## Don't display last user logon
Set the registry key: `DontDisplayLastUserName` to `0`

<br/>

## Share directory from command line
### Add
```
C:\> net share MyShare=C:\Dir1\Dir2 /grant:Everyone,full
```

### Delete
```
C:\>net share MyShare /delete
```
<br/>

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
* [Windows Customer Experience Improvement Program...](https://technet.microsoft.com/en-us/library/cc766341(v=ws.10).aspx) 
  *  Please note the section *[Procedures for Controlling the Windows Customer Experience...](https://technet.microsoft.com/en-us/library/cc766341(v=ws.10).aspx#BKMK_Procedures)*

### Reference
Source: [here](https://social.technet.microsoft.com/Forums/windows/en-US/0439e00b-f44a-40ac-999c-e574cb575ba9/user-logoff-notification-for-customer-experience-improvement-program?forum=w7itprogeneral)

## Run python script embedded in .bat file
```batch
@SETLOCAL ENABLEDELAYEDEXPANSION & python -x "%~f0" %* & EXIT /B !ERRORLEVEL!
# Your python code goes here...
```
Taken from [StackOverflow](https://stackoverflow.com/questions/17467441/how-to-embed-python-code-in-batch-script), see detailed explanation of the operation there.