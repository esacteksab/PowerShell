C:\PS>get-eventlog -logname System -EntryType Error

Description
-----------
This command gets only error events from the System event log.

C:\PS>get-eventlog -logname System -EntryType Error | FL -Property *

Description
-----------
This command gets only error events from the System event log, then Format List to display all properties of Event ID