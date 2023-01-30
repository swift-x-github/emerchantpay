# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    let(:user) { create(:user, email: 'Test@test.rb', name: 'John Doe') }

    context 'when email' do
      it 'should have validations' do
        expect(user.email).to eq('test@test.rb')
        expect(user).to validate_presence_of(:email)
        expect(user).to allow_value('test@test.com').for(:email)
        expect(user).not_to allow_value('test@test').for(:email)
        expect(user).not_to allow_value('test').for(:email)
      end
    end
  end

  it 'should include needed modules' do
    expect(User).to include_modules Users::Roles,
                                    Users::Statuses,
                                    Users::Validations
  end

  describe '#to_param' do
    let(:user) { build_stubbed(:user, id: 555) }

    it 'should return stringified id' do
      expect(user.to_param).to eq '555'
    end
  end
end
