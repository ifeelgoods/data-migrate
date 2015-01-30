require 'active_record'

module DataMigrate
  class DataMigrator < ActiveRecord::Migrator
    class << self
      def migrate(*arg)
        begin
          @_data_migrate_original_schema_migrations_table_name = ActiveRecord::Base.schema_migrations_table_name
          ActiveRecord::Base.schema_migrations_table_name = 'data_migrations'
          super
        ensure
          ActiveRecord::Base.schema_migrations_table_name = @_data_migrate_original_schema_migrations_table_name
        end
      end

      def migrations_path
        'db/data'
      end
    end
  end
end
