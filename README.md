Data Migrate
====

Run data migrations.

Data migrations are stored in db/data. They act like schema
migrations, except they should be reserved for data migrations. For
instance, if you realize you need to titleize all your titles, this
is the place to do it.

Why should I use this?
----------------------

Its seems when a project hits a certain size, I get to manipulate data
outside the application itself.  Changing defaults, new validations,
one-to-one to one-to-many... I found it a pain and dodgy to have to
step up migrations one by one, run a ruby script of some sort, then
resume migrations.  It tanks a lot of the automation of deploy.

If you don't use the one off scripts, you could do it as a regular
migration.  It'd be much better to keep concerns separate. The benefit
of having them separate has to do with your data model.

What's it do?
-------------

Data migrations are stored in db/data. They act like schema
migrations, except they should be reserved for data migrations. For
instance, if you realize you need to titleize all yours titles, this
is the place to do it. Running any of the provided rake tasks also
creates a data schema table to mirror the usual schema migrations
table to track all the goodness.

Data migrations can be created at the same time as schema migrations,
or independently.  Database (db:) tasks have been added and extended
to run on data migrations only, or in conjunction with the schema
migration.  For instance, `rake db:migrate:with_data` will run both
schema and data migrations in the proper order.

Rails 4 and Ruby 2.0
--------------------

Data Migrate is Rails 4 and Ruby > 2.0 compatible.

Installation
------------
Add the gem to your project

    # Gemfile
    gem 'data_migrator'

Then `bundle install` and you are ready to go.

So you know, when you use one of the provide rake tasks, a table
called 'data_migrations' will be created in your database. This
is to mirror the way the standard 'db' rake tasks work. If you've
installed previous to v1.1.0, you'll want to delete the
'create\_data\_migrations_table' migration.

Usage
-----

### Generating Migrations

You can generate a data migration as you would a schema migration:

    rails g data_migration add_this_to_that


### Rake Tasks

    $> rake -T data
    rake data:forward                 # Pushes the schema to the next version (specify steps w/ STEP=n)
    rake data:migrate                 # Migrate data migrations (options: VERSION=x, VERBOSE=false)
    rake data:migrate:down            # Runs the "down" for a given migration VERSION
    rake data:migrate:redo            # Rollbacks the database one migration and re migrate up (options: STEP=x, VERSIO...
    rake data:migrate:status          # Display status of data migrations
    rake data:migrate:up              # Runs the "up" for a given migration VERSION
    rake data:rollback                # Rolls the schema back to the previous version (specify steps w/ STEP=n)
    rake data:version                 # Retrieves the current schema version number for data migrations

Tasks work as they would with the 'vanilla' db version. 

With 'up' and 'down', you can specify the option 'BOTH', which defaults to false. Using true, will migrate the data if it matches the version provided. Down its data.

For more example, assume you have the file:
  db/data/20110419021211_add_x_to_y.rb

Running `rake data:migrate  VERSION=20110419021211` would execute the 'db/data' version.
