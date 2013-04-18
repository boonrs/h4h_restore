# Restore Donation Form

[![Build Status](https://travis-ci.org/boonrs/h4h_restore.png?branch=master)](https://travis-ci.org/boonrs/h4h_restore)

A donor form for Habitat for Humanity's ReStore.

### Database Setup

1. Install PostgreSQL.
1. Create a database user using the following command.

        createuser -d -S -R -P h4h_restore

1. Enter "sellingstuff" as the password.
1. From the Rails application root directory, run the following command.

        rake db:create

1. From the Rails application root directory, run the following command.

        rake db:migrate
