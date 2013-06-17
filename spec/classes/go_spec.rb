require "spec_helper"

describe "go" do
  let(:facts) { default_test_facts }

  it do
    should include_class("boxen::config")
    should contain_package("go").with_ensure(:absent)

    should contain_file("/test/boxen/env.d/goenv.sh").with({
      :mode => '0755'
    })

    should contain_repository("/test/boxen/goenv").with({
      :ensure => "v0.0.2",
      :source => "wfarr/goenv",
      :user   => "testuser"
    })
  end

  context "linux" do
    let(:facts) { default_test_facts.merge(:osfamily => "Linux") }

    it do
      should_not include_class("boxen::config")
      should_not contain_package("go").with_ensure(:absent)
    end
  end
end
