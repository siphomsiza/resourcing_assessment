FactoryGirl.define do
  factory :user do
    email     {Faker::Internet.email()}
    firstname {Faker::Name.first_name}
    lastname  {Faker::Name.last_name}
    before(:create) do |user|
      pass = Faker::Lorem.words(8)
      user.password = pass
      user.password_confirmation = pass
    end
  end
end
