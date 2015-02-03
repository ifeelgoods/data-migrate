require_relative 'data_migrator/railtie'
require_relative 'generators/data_migrator'

module DataMigrator
  mattr_accessor :env_prefix
  mattr_accessor :activated
  SCHEMA_MIGRATIONS_TABLE_NAME = 'data_migrations'
  MIGRATION_PATH = 'db/data'
end
