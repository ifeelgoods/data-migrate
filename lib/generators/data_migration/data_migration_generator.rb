require 'generators/data_migrator'
require 'rails/generators'
require 'rails/generators/migration'

module DataMigrator
  module Generators
    class DataMigrationGenerator < Rails::Generators::NamedBase
      namespace "data_migration"
      include Rails::Generators::Migration

      def create_data_migration
        migration_template "data_migration.rb", "db/data/#{file_name}.rb"
      end

      protected
      attr_reader :migration_action

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.new.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
    end
  end
end
