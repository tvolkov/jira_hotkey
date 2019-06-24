#!/bin/sh
# how to get it working on macOS:
# 1. hit CMD+Space and search for 'Automator'
# 2. Once Automator is open cick 'Quick Action'
# 3. for 'Workflow receives current' choose 'no input'
# 4. from the 'Actions' pane select 'Run Shell Script' and drag-n-drop it to the right pane
# 5. put the absolute path to this script to the text field
# 6. Save it and close Automator
# 7. goto System Preferences -> Keyboard -> Shortcuts -> Services and find the service you've just saved
# 8. dbl-click on the right of it and press the desired keystroke. Close the preferences windoe
# 9. have fun!

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

