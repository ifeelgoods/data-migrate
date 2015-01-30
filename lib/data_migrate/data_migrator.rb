require 'active_record'

module DataMigrate
  class DataMigrator < ActiveRecord::Migrator
    class << self

      def schema_migrations_table_name
        'data_migrations'
      end

      def migrations_path
        'db/data'
      end
    end
  end
end
