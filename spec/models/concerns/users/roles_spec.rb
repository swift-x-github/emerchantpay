# frozen_string_literal: true

require 'rails_helper'

describe Users::Roles, type: :model do
  let(:model) { DummyModel.generate(:user, [Users::Roles]) }
  let(:user) { build_stubbed(:user, :dummy, model: model) }

  it 'should have enums' do
    expect(user).to define_enum_for(:role)
      .with_values admin: 0, merchant: 1
  end

  describe 'scopes' do
    describe '.merchants' do
      let!(:merchant) { create(:merchant, :dummy, model: model) }

      it 'should include only merchants' do
        expect(model.merchants.count).to eq 1
        expect(model.merchants).to match_array [merchant]
      end
    end

    describe '.admins' do
      let!(:admin) { create(:admin, :dummy, model: model) }

      it 'should include only admins' do
        expect(model.admins.count).to eq 1
        expect(model.admins).to match_array [admin]
      end
    end
  end
end
