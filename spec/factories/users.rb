FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "John-#{n}"
    end
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'passowrd'
  end
end
