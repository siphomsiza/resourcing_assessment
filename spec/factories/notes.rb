FactoryGirl.define do
  factory :note do
    association(:user)
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph}
    color {["yellow","blue","green","pink"].sample}
    private {Faker::Boolean.boolean}
    pos_x {Faker::Number.number(2)+"px"}
    pos_y {Faker::Number.number(2)+"px"}
    z_index {Faker::Number.digit}

    factory :invalid_note do
      title nil
    end

  end
end
