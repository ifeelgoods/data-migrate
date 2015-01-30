require 'rails/generators/named_base'
module DataMigrator
  module Generators
    class DataMigrationGenerator < Rails::Generators::NamedBase #:nodoc:
      def self.source_root
         @_data_migrator_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), generator_name, 'templates'))
      end
    end
  end
end
