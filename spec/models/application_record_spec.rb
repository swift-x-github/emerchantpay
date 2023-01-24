require 'rails_helper'

describe ApplicationRecord, type: :model do
  describe 'EMAIL_FORMAT' do
    shared_examples 'match success' do |value|
      it { expect(ApplicationRecord::EMAIL_FORMAT).to match(value) }
    end
    shared_examples 'not match success' do |value|
      it { expect(ApplicationRecord::EMAIL_FORMAT).not_to match(value) }
    end

    it_should_behave_like 'match success', 'swift@gmail.com'
    it_should_behave_like 'match success', 'swift.x+@yahoo-x.com'
    it_should_behave_like 'match success', 'swift@yahoo.techno'
    it_should_behave_like 'match success', 'xx_x_@hotmail.com'
    it_should_behave_like 'match success', "swift'x.777@gmail.com"
    it_should_behave_like 'match success', 'x@x.x'
    it_should_behave_like 'match success', 'swiftç@gmail.com'
    
    it_should_behave_like 'not match success', '@'
    it_should_behave_like 'not match success', 'x@x'
    it_should_behave_like 'not match success', 'email'
    it_should_behave_like 'not match success', '12345'
    it_should_behave_like 'not match success', '@gmail.com'
    it_should_behave_like 'not match success', 'emails gogo@yahoo.com'
  end
end
