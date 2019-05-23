#!/bin/bash

set -e

if [ "$ENV" = 'DEV' ]; then
	echo "Running Developer Server"
	exec python "webpage.py"
else
	echo "Running Production Server"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/webpage.py --callable app --stats 0.0.0.0:9191
fi
