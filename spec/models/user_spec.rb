require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'Create user' do
    it 'should create user' do
      user = FactoryBot.build(:user)
      expect(user.save).to be_truthy
    end
  end

  describe 'Change user' do
    it 'should change card number' do
      expect(user.update(card_number: '79927398713')).to be_truthy
    end

    it 'should not change card number' do
      expect(user.update(card_number: '79927398710')).to be_falsey
    end
  end
end
