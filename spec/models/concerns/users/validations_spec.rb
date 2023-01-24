require 'rails_helper'

describe Users::Validations, type: :model do
  let(:model) { DummyModel.generate(:user, [Users::Validations]) }
  let(:user) { build :user, :dummy, model: model }

  describe 'validations' do
    context 'when name' do
      it 'should have validations' do
        expect(user).to validate_presence_of(:name)
      end
    end
  end
end