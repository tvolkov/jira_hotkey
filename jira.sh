#!/bin/sh

if [ -z "$JIRA_URL" ]; then
    JIRA_URL="http://jira.grt.wiley.com/browse"
fi

if [ -z "$TICKET_PREFIX" ]; then
    TICKET_PREFIX="PL-"
fi

MESSAGE="Enter JIRA ticket number:"

showKdeDialog() {
    ID=`kdialog --inputbox "$MESSAGE"`
}

showGnomeDialog() {
    ID=$(zenity --entry --text="$MESSAGE" --entry-text="$ID")
}

DE=`echo $DESKTOP_SESSION`

case `echo $DESKTOP_SESSION` in
"gnome") 
    showGnomeDialog
    ;;
"plasma") 
    showKdeDialog
    ;;
*)
    echo "unknown desktop environment";;
esac;

if [ ! -z "$ID" ]; then
    xdg-open "$JIRA_URL/$TICKET_PREFIX$ID"
fi

