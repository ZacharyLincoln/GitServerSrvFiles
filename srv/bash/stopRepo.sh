NAME=$1
echo "Stopping $NAME"

echo "Removing From Start"
rm /srv/bash/Startup/$NAME.sh

echo "Removing hook from git"
rm /srv/git/$NAME/$NAME.git/hooks/post-receive

#echo "Stopping Old Process if any"
PID=$(pgrep -f /srv/git/.running/$NAME)
#echo "$PID"
#echo "$NAME"
echo "$PID"
kill -9 $PID
