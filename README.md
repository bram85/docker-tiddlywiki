Dockerfile for TiddlyWiki
=========================

This Dockerfile creates a TiddlyWiki container based on NodeJS. To mount the
content as a volume, use the path /usr/src/app/wiki inside the container.

Run with:

    docker run --name tiddlywiki -p 8080:8080 -v $HOME/wiki:/usr/src/app/wiki -d bram85/tiddlywiki

Environment variables
---------------------

* TW_USER: username for HTTP Basic authentication for signing edits. Defaults
           to an empty username (no sign-offs).
* TW_PASSWORD: password for HTTP Basic authentication for signing edits.
               Defaults to no password.

