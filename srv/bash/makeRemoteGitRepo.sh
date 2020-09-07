echo Creating new directory /srv/git/$@
mkdir /srv/git/$@
mkdir /srv/git/$@/$@.git
echo Creating new git repo @ /srv/git/$@/$@.git
git init --bare /srv/git/$@/$@.git
echo Created new git repository /srv/git/$@/$@.git
