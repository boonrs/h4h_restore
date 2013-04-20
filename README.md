# Restore Donation Form

[![Build Status](https://travis-ci.org/boonrs/h4h_restore.png?branch=master)](https://travis-ci.org/boonrs/h4h_restore)

A donor form for Habitat for Humanity's ReStore.

## Getting Started: an incomplete guide

* Install git
* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Vagrant](http://www.vagrantup.com/)
* clone the repository

        git clone git@github.com:boonrs/h4h_restore.git

* Launch Vagrant. This will take a while the first time

        vagrant up

* SSH to the VM (if using windows, use git bash)

        vagrant ssh

* Launch the server

        cd /vagrant
        rails server

* Visit [localhost:3000](http://localhost:3000)
