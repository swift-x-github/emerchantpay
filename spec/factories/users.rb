FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:name) { |n| "User Name #{n}" }
    status { 'active' }
    role { 'admin' }
  end
  
  trait(:dummy) do
    transient do
      model { User }
    end

    initialize_with do
      model.new(attributes)
    end
  end


  factory :admin, parent: :user do
    role { :admin }
    status { 'active' }
  end

  factory :merchant, parent: :user do
    role { :merchant }
    status { 'active' }
  end

end
