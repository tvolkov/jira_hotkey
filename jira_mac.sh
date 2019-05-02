#!/bin/sh

if [ -z "$JIRA_URL" ]; then
    JIRA_URL="https://jira.global.tesco.org/browse/PDR-"
fi

MESSAGE="Enter Jira ticket number:"

showMacDialog(){
ID=$(osascript <<EOT
      tell app "System Events"
        text returned of (display dialog "$MESSAGE" default answer "" buttons {"OK"} default button 1 with title "$(basename $0)")
      end tell
EOT)
}

showMacDialog

if [ ! -z "$ID" ]; then
    open "$JIRA_URL$ID"
fi

