#require it, only when needed!

if DataMigrator.activated == true
  class ActiveRecord::MigrationProxy
    def initialize(name, version, filename, scope)
      if DataMigrator.env_prefix.present?
        version = "#{DataMigrator.env_prefix}_#{version}"
      end

      super(name, version, filename, scope)
    end
  end
  class ActiveRecord::Migrator
    private
    def ran?(migration)
      migrated.include?(migration.version)
    end
  end
end
