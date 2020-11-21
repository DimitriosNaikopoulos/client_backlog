require 'rails_helper'

RSpec.describe Backlog, type: :model do
  it { is_expected.to have_many :tickets }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }

  describe '#search_backlogs' do
    let(:query) { 'my backlog' }
    let(:title_match_backlog) { create(:backlog, title: 'This is my backlog') }
    let(:body_match_backlog) { create(:backlog, body: 'This is my backlog') }
    let(:backlogs) { create_list(:backlog, 20) }

    it 'should return the correct backlogs' do
      search_response = Backlog.search_backlogs(query)
      binding.pry
      expect(search_response.size).to eq(2)
    end

    it 'should prioritise title over body matches' do

    end

  end
end
