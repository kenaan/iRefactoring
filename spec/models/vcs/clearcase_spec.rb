require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe Vcs::Clearcase do
  before(:each) do
    DDR_ENV[:vcs] = "clearcase"
    DDR_ENV[:language] = "c++"
    DDR_ENV[:project_root] = File.join(RAILS_ROOT+ "/spec/fixtures/clearcase_and_cpp_projects")
    @parser = Vcs::Clearcase.new()
  end
  
  it 'should read source code commits' do
    commits = @parser.get_code_committed()
    commits['/view/hudson_onu2000_nt_ci_view/vobs/dsl/source18/bcm54616_driver/include/phy_mac_wp3.h'].should == 1
  end
  
  it 'should combine commits for the same source code' do
    commits = @parser.get_code_committed()
    commits['/view/hudson_onu2000_nt_ci_view/vobs/dsl/source18/bcm54616_driver/source/phy_rw.c'].should == 2
  end
  
  it 'should ignore commits which is not source code' do
    commits = @parser.get_code_committed()
    commits['/view/hudson_onu2000_nt_ci_view/vobs/dsl/source18/bcm54616_driver/Makefile'].should == nil
  end
end