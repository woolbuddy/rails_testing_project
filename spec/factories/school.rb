FactoryBot.define do
  factory :school, class: School do
    name { "DevPoint" }
    address { "123" }
    principal { "Mr. Mean" }
    capacity { 3000 }
    private_school { true }
  end
end