require 'test_helper'
require 'support/rake'

describe 'rake tasks' do
  include_context "rake"

  before do
    subject.invoke(*task_args)
  end

  def get_versions
    ActiveRecord::Base.connection.execute('SELECT * from data_migrations').to_a
  end

  describe 'data:migrate' do
    it "add version to data_migration" do
      assert_equal get_versions.any?, true
    end
  end
end