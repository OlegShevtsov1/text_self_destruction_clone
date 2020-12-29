require 'spec_helper'
require 'fetcher'

describe Fetcher do
  context 'when calling the real thing' do
    it 'does not throw an error' do
      VCR.use_cassette('correct_result') do
        fetcher = described_class.new(1)
        res = fetcher.result
        expect(res.keys).to include('data')
        # expect(res['data'].keys).to include('children')
        # expect(res['data']['children'].count).to be >= 1
        # expect(res['data']['children'][0].keys).to include('data')
        # test more stuff!
      end
    end
  end
end
