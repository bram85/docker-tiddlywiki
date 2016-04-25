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
* TW_LAZY: whether the instance should use lazy loading. It accepts two values:
           'images' or 'all'. By default no lazy loading is applied, so all
           content is loaded at once.

Running TiddlyWiki behind a reverse proxy (nginx)
------------------------------------------------

Suppose you run TiddlyWiki as a subdirectory of some domain, for example
https://example.org/notes. TiddlyWiki doesn't support this, but you can use
nginx to work around this.

Use the following configuration:

```
location /notes/ {
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_pass http://localhost:8080/;
          proxy_redirect default;
}

# Only if you run TiddlyWiki in a subdirectory instead of a subdomain
location ~ ^/(status|recipes|bags) {
  if ($http_referer = https://example.org/notes/) {
    rewrite ^(.*)$ /notes$1;
  }
}
```
