---
title: Setting Up Jekyll Site
date: 2021-11-21
---
OK, I've set up another Jekyll Website. I'm hoping to use this one for real. It's in folder real-thing on Nextcloud
and I'm not going to bother with Github or Gitlab or anything.

The focus is going to be pages, but there is a posts section where this post is located.

I had to change permissions on 192.168.86.20 so that the owner of /var/www/html is terry and the group is www-data. And I had to change the permissions to 750. The commands I used are:

{% highlight bash %}
cd /var/www
sudo chown -R www-data:www-data html
sudo chmod -R 770 html
{% endhighlight %}

I also fooled around with changing themes and it's a pain in the butt. Layouts that aren't there, plugins required for things that I don't care about like SEO.
