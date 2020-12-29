# require 'rspec/autorun'
# require_relative 'github_api_example'

### https://www.rubyguides.com/2018/12/ruby-vcr-gem/

describe GithubService do
  let(:user_response) { described_class.user('ruby') }

  xit 'can fetch & parse user data' do
    expect(user_response).to be_kind_of(Hash)
    expect(user_response).to have_key(:id)
    expect(user_response).to have_key(:type)
  end
end
