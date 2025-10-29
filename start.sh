#!/usr/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WIKIEXE=/usr/local/bin/tiddlywiki

WIKIDIR=$SCRIPT_DIR/notes-wiki
ACCESS_LOG=$SCRIPT_DIR/access.log
ERROR_LOG=$SCRIPT_DIR/error.log
WIKI_PID=$SCRIPT_DIR/wiki.pid

PORT=9002

cd $CRIPT_DIR
nohup $WIKIEXE $WIKIDIR --listen port=$PORT debug-level=none > $ACCESS_LOG 2> $ERROR_LOG < /dev/null & echo $! > $WIKI_PID

