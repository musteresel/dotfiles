#!bash
killall dzen2 2> /dev/null
killall panel.sh 2> /dev/null

herbstclient pad 0 7
FG='white'
BG='black'
FONT='-*-*-*-*-*-*-10-*-*-*-*-*-*-*'
WIDTH=1366

addpanelcontent()
{
  panelcontent="$panelcontent $@ |||"
}

{
while true
do
  panelcontent='||| '
  addpanelcontent $(date)
  addpanelcontent $(herbstclient tag_status)
  echo "$panelcontent"
  sleep 1
done
} 2> /dev/null | dzen2 -ta c -y 0 -x 0 -h 15 -w $WIDTH &
