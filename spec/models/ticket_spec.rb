require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { is_expected.to belong_to :backlog }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }

  describe '#search_tickets' do
    let(:query) { 'my ticket' }
    let(:backlog_id) { 1 }
    let!(:subject) { Ticket.search_tickets(query, backlog_id) }

    before(:all) do
      create_default(:backlog, id: 1)
      create(:ticket, title: 'This is my ticket')
      create(:ticket, description: 'This is my ticket')
      create_list(:ticket, 20)
    end

    it 'should return the correct tickets' do
      expect(subject.size).to eq(2)
    end

    it 'should prioritise title over body matches' do
      expect(subject.first.title).to eq('This is my ticket')
      expect(subject[1].description).to eq('This is my ticket')
    end
  end
end
