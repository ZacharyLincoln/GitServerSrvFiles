NAME=$1
echo "Starting $NAME"


echo "Stopping Old Process if any"
PID=$(pgrep -f /srv/git/.running/$NAME)
echo "$PID"
echo "$NAME"
echo "$PID"
kill -9 $PID

echo "Deleting old files"
rm -f -r /srv/git/.running/$NAME
mkdir /srv/git/.running

rm /srv/bash/Startup/$NAME.sh
echo "Adding start on run bash"
touch /srv/bash/Startup/$NAME.sh
echo "echo $NAME" >> /srv/bash/Startup/$NAME.sh
chmod 777 /srv/bash/Startup/$NAME.sh

echo "Removing hook from git"
rm /srv/git/$NAME/$NAME.git/hooks/post-receive


echo "Cloning repo"
git -C /srv/git/.running clone ssh://git@127.0.0.1:22/srv/git/$NAME/$NAME.git


PATHTORUN=$(find /srv/git/.running/$NAME -name "startup.sh")
echo $PATHTORUN /srv/git/.running/$NAME

echo "Adding Hook to git"
touch /srv/git/$NAME/$NAME.git/hooks/post-receive

echo "PID=\$(pgrep -f /srv/git/.running/$NAME)" >> /srv/git/$NAME/$NAME.git/hooks/post-receive
echo "kill -9 \$PID" >> /srv/git/$NAME/$NAME.git/hooks/post-receive
echo "rm -f -r /srv/git/.running/$NAME" >> /srv/git/$NAME/$NAME.git/hooks/post-receive
echo "git -C /srv/git/.running clone ssh://git@127.0.0.1:22/srv/git/$NAME/$NAME.git" >> /srv/git/$NAME/$NAME.git/hooks/post-receive
echo "PATHTORUN=\$(find /srv/git/.running/$NAME -name "startup.sh")" >> /srv/git/$NAME/$NAME.git/hooks/post-receive
echo "$PATHTORUN /srv/git/.running/$NAME" >> /srv/git/$NAME/$NAME.git/hooks/post-receive
chmod 777 /srv/git/$NAME/$NAME.git/hooks/post-receive


echo "Removing start on run bash"


echo "Adding start on run bash"

echo "$NAME"
echo "$PATHTORUN /srv/git/.running/$NAME"
$PATHTORUN /srv/git/.running/$NAME
