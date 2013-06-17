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

    should contain_exec("goenv install 1.2.3").with({
      :command  => "/test/boxen/goenv/bin/goenv install 1.2.3",
      :creates  => "/test/boxen/goenv/versions/1.2.3",
      :provider => "shell",
      :user     => "testuser"
    })
  end

  context "ensure => absent" do
    let(:params) { default_params.merge(:ensure => "absent") }

    it do
      should contain_file("/test/boxen/goenv/versions/1.2.3").with({
        :ensure => "absent",
        :force  => true
      })
    end
  end
end
