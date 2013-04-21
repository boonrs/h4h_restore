FactoryGirl.define do
  factory :donation do
    poundage { rand(100) }
    donor
  end
end
