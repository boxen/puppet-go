require 'spec_helper'

describe 'go::global' do
  let(:facts) { default_test_facts }
  let(:params) do
    {
      :version => '1.3.3'
    }
  end

  it do
    should include_class('go')
    should contain_go__version('1.3.3')

    should contain_file('/test/boxen/chgo/version').with({
      :content => "1.3.3\n",
    })
  end
end
