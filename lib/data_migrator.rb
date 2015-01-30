require File.join(File.dirname(__FILE__), 'data_migrator', 'railtie')

module DataMigrator
  SCHEMA_MIGRATIONS_TABLE_NAME = 'data_migrations'
  MIGRATION_PATH = 'db/data'
end
