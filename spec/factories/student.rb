FactoryBot.define do
  factory :student, class: Student do
    name { "Bob" }
    student_number { 9999 }
    gpa { 2.6 }
    school
  end
end