require 'faker'

FactoryGirl.define do
  factory :student do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    #Date between 20-25 years (from today date between 20 years ago to 15 years ago)
    f.dob "20-02-2012"#between_except(20.year.ago, 15.year.from_now, Date.today) }
    f.age { Faker::Number.between(20, 25) }
  end
end
