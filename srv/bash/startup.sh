#!/bin/bash
for f in /srv/bash/Startup/*.sh; do
	    # do some stuff here with "$f"
	    NAME=$($f)
	    /srv/bash/runRepo.sh $NAME & pid=$!

done
