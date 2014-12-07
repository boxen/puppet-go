require "spec_helper"

describe "go::version" do
  let(:default_params) do
    {
      :ensure => :present
    }
  end

  let(:facts) { default_test_facts }
  let(:title) { "1.2.3" }

  it do
    should include_class("go")

    should contain_exec("chgo install 1.2.3").with({
      :command  => "source /test/boxen/chgo/share/chgo/chgo.sh && chgo_install 1.2.3",
      :creates  => "/test/boxen/chgo/versions/1.2.3",
      :provider => "shell",
      :user     => "testuser"
    })
  end

  context "ensure => absent" do
    let(:params) { default_params.merge(:ensure => "absent") }

    it do
      should contain_file("/test/boxen/chgo/versions/1.2.3").with({
        :ensure => "absent",
        :force  => true
      })
    end
  end
end
