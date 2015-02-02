require 'spec_helper'

describe 'rake tasks' do

  def get_versions
    ActiveRecord::Base.connection.execute('SELECT * from data_migrations').to_a
  end

  def exec_cmd(cmd)
    `cd #{MIGRATOR_ROOT}/spec/dummy && RAILS_ENV=test #{cmd}`
  end

  describe 'data:migrate' do
    it "add version to data_migration" do
      exec_cmd('rake data:migrate')
      puts get_versions
    end
  end
end