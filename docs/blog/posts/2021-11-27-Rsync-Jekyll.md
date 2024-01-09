---
title: Rsync and Jekyll
date: 2021-11-27
tags:
    - rsync
    - jekyll
---

I have a working shell script to upload this jekyll site to 192.168.86.20. Here's the code

``` bash
    #!/bin/bash
    cd /home/terry/Sync/real_thing
    bundle exec jekyll build --baseurl ""
    rsync -vrzc --chown=www-data:www-data /home/terry/Nextcloud/real_thing/_site/* terry@192.168.86.20:/home/terry/webroot

```
