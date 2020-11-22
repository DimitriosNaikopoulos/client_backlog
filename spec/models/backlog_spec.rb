# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Backlog, type: :model do
  it { is_expected.to have_many :tickets }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }

  describe '#search_backlogs' do
    let(:query) { 'my backlog' }
    let!(:subject) { Backlog.search_backlogs(query) }

    before(:all) do
      create(:backlog, title: 'This is my backlog')
      create(:backlog, body: 'This is my backlog')
      create_list(:backlog, 20)
    end

    it 'should return the correct backlogs' do
      expect(subject.size).to eq(2)
    end

    it 'should prioritise title over body matches' do
      expect(subject.first.title).to eq('This is my backlog')
      expect(subject[1].body).to eq('This is my backlog')
    end
  end
end
