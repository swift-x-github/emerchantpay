require 'rails_helper'

describe Users::Statuses, type: :model do
  let(:model) { DummyModel.generate(:user, [Users::Statuses]) }
  let(:user) { build :user, :dummy, model: model }

  it 'should have enums' do
    expect(user)
      .to define_enum_for(:status).with_values(active: 0, inactive: 1)
  end

  describe 'scopes' do
    describe '.connected' do
      subject(:result) { model.connected }

      let!(:active_user) { create :user, :active, :dummy, model: model }
      let!(:inactive_user) { create :user, :inactive, :dummy, model: model }

      it 'should return users with active and inactive statuses' do
        expect(result).to match_array [active_user, inactive_user]
      end
    end

    describe '.active' do
      subject(:result) { model.active }

      let!(:active_user_1) { create :user, :active, :dummy, model: model }
      let!(:active_user_2) { create :user, :active, :dummy, model: model }
      let!(:inactive_user_1) { create :user, :inactive, :dummy, model: model }

      it 'should return users with active statuses' do
        expect(result).to match_array [active_user_1, active_user_2]
      end
    end

    describe '.inactive' do
      subject(:result) { model.inactive }

      let!(:inactive_user_1) { create :user, :inactive, :dummy, model: model }
      let!(:inactive_user_2) { create :user, :inactive, :dummy, model: model }
      let!(:active_user_1) { create :user, :active, :dummy, model: model }

      it 'should return users with inactive statuses' do
        expect(result).to match_array [inactive_user_1, inactive_user_2]
      end
    end
  end
end
