namespace :data do
  desc 'Migrate data migrations (options: VERSION=x, VERBOSE=false)'
  task :migrate => :environment do
    use_data do
      DataMigrate::DataMigrator.migrate("db/data/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    end
  end

  namespace :migrate do
    desc 'Rollbacks the database one migration and re migrate up (options: STEP=x, VERSION=x).'
    task :redo => :environment do
      if ENV["VERSION"]
        Rake::Task["data:migrate:down"].invoke
        Rake::Task["data:migrate:up"].invoke
      else
        Rake::Task["data:rollback"].invoke
        Rake::Task["data:migrate"].invoke
      end
    end

    desc 'Runs the "up" for a given migration VERSION.'
    task :up => :environment do
      use_data do
        version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
        raise "VERSION is required" unless version
        DataMigrate::DataMigrator.run(:up, "db/data/", version)
      end
    end

    desc 'Runs the "down" for a given migration VERSION.'
    task :down => :environment do
      use_data do
        version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
        raise "VERSION is required" unless version
        DataMigrate::DataMigrator.run(:down, "db/data/", version)
      end
    end

    desc "Display status of data migrations"
    task :version => :environment do
      use_data do
        DataMigrate::DataMigrator.version
      end
    end


    desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
    task :rollback => :environment do
      use_data do
        step = ENV['STEP'] ? ENV['STEP'].to_i : 1
        DataMigrate::DataMigrator.rollback('db/data/', step)
      end
    end

    desc 'Pushes the schema to the next version (specify steps w/ STEP=n).'
    task :forward => :environment do
      use_data do
        step = ENV['STEP'] ? ENV['STEP'].to_i : 1
        # TODO: No worky for .forward
        # DataMigrate::DataMigrator.forward('db/data/', step)
        migrations = DataMigrate::DataMigrator.pending_migrations.reverse.pop(step).reverse
        migrations.each do |pending_migration|
          DataMigrate::DataMigrator.run(:up, "db/data/", pending_migration[:version])
        end
      end
    end

    desc "Retrieves the current schema version number for data migrations"
    task :version => :environment do
      use_data do
        puts "Current data version: #{DataMigrate::DataMigrator.current_version}"
      end
    end
  end
end


def use_data
  begin
    data_migrate_original_schema_migrations_table_name = ActiveRecord::Base.schema_migrations_table_name
    ActiveRecord::Base.schema_migrations_table_name = DataMigrate::DataMigrator.schema_migrations_table_name
    yield
  ensure
    ActiveRecord::Base.schema_migrations_table_name = data_migrate_original_schema_migrations_table_name
  end
end