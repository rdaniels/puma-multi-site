Puma_Multi_Site
===============

Files used in configuring Puma to work with more than 1 site on server

/etc/init.d/puma
/etc/puma.conf
<rails site>/config/deploy.rb
<rails site>/config/puma.rb

It took a while for me to get puma to properly handle CAP DEPLOY with multiple sites, there was an issue with it not killing all of the puma ruby processes before starting new one. Here's what I used to finally get it to work.
