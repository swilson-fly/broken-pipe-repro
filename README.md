# broken-pipe-repro
This is a minimal repro case for the `ERROR stderr to vsock zero copy err: Broken pipe (os error 32)` issue we've been seeing in Fly Logs. Simply deploy this app with `fly launch`, and Fly Logs will begin returning the Broken Pipe error for every log line.
To fix the broken pipe, comment out these two lines in nginx.conf and redeploy:
```
error_log /dev/stdout info;
access_log /dev/stdout main;
```
With those disabled, nginx falls back to the default logging behaviour, which uses a symlink to stdout and stderr for posting logs. 
