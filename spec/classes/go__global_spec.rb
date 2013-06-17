require "spec_helper"

describe "go::global" do
  let(:facts) { default_test_facts }
  let(:params) do
    {
      :version => "1.1.1"
    }
  end

  it do
    should include_class("go")
    should include_class("go::1_1_1")

    should contain_file("/test/boxen/goenv/version").with({
      :content => "1.1.1\n",
    })
  end
end
