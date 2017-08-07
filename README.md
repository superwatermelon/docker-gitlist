# Gitlist Docker Image

Docker images for running [Gitlist][gitlist] repository viewer.

```
           +---------------+
-- :80 --> | gitlist-nginx |
           +---------------+
                   |
                 :9000
                   |
                   v
          +-----------------+
          | gitlist-php-fpm | --> volume:/var/git
          +-----------------+
```

[gitlist]: http://gitlist.org/
