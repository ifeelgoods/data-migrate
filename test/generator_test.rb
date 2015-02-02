require 'test_helper'

class ControllersGeneratorTest < Rails::Generators::TestCase
  tests DataMigrator::Generators::DataMigrationGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert no controllers are created with no params" do
    run_generator %w{toto}
    assert_migration "db/data/toto.rb"
  end

end