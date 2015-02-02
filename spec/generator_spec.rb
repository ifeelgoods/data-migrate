require 'spec_helper'

require "generator_spec"

describe DataMigrator::Generators::DataMigrationGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before(:all) do
    prepare_destination
  end

  test "Assert no controllers are created with no params" do
    run_generator %w{toto}
    assert_migration "db/data/toto.rb"
  end

end