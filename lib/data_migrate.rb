require File.join(File.dirname(__FILE__), 'data_migrate', 'data_migrator')
require File.join(File.dirname(__FILE__), 'data_migrate', 'railtie')

module DataMigrate
  SCHEMA_MIGRATIONS_TABLE_NAME = 'data_migrations'
  MIGRATION_PATH = 'db/data'
end
