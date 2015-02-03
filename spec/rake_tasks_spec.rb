require 'spec_helper'

describe 'rake tasks' do

  ### Helpers ###
  def debug(mes)
    if ENV['DEBUG'] == 'true'
      puts mes
    end
  end

  def get_data_versions
    ActiveRecord::Base.establish_connection
    res = ActiveRecord::Base.connection.execute('SELECT * from data_migrations').to_a.map{|r| r['version']}
    debug "Result get_data_versions: #{res}"
    res
  end

  def get_versions
    ActiveRecord::Base.establish_connection
    res = ActiveRecord::Base.connection.execute('SELECT * from schema_migrations').to_a.map{|r| r['version']}
    debug "Result get_versions: #{res}"
    res
  end

  def exec_cmd(cmd)
    cmd_final = "cd #{MIGRATOR_ROOT}/spec/dummy && RAILS_ENV=test #{cmd}"

    debug "Executing: #{cmd_final}"
    res = `#{cmd_final}`
    debug "Result: #{res}"
    res
  end

  def rake(task)
    exec_cmd("rake #{task}")
  end
  #### End Helpers ####

  before(:each) do
    DatabaseCleaner.clean
  end

  describe 'db:data:migrate' do
    it "add an user" do
      expect{rake('db:data:migrate')}.to change{User.count}.by (2)
    end

    it "add version to data_migration" do
      rake('db:data:migrate')
      expect(get_data_versions.any?).to eq(true)
    end

    it "does not change schema migration" do
      expect{rake('db:data:migrate')}.to_not change{get_versions}
    end
  end

  describe 'db:migrate' do
    it 'does not add an user' do
      expect{rake('db:migrate')}.to_not change{User.count}
    end

    it "does not add version to data_migration" do
      rake('db:migrate')
      expect(get_data_versions.any?).to eq(false)
    end
  end
end