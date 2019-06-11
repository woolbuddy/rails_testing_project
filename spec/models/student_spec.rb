require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { FactoryBot.create(:student) }

    describe 'attributes' do
      it 'has a name' do  
        expect(student.name).to eq(student.name)
      end
  
      it 'has a student_number' do
        expect(student.student_number).to eq(student.student_number)
      end
  
      it 'has a gpa' do
        expect(student.gpa).to eq(student.gpa)
      end

      it 'has a school_id' do
        expect(student.school_id).to eq(student.school_id)
      end
  
    end
  
    describe "vaildations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :student_number }
      it { should validate_presence_of :gpa }
      
      
      it 'has a student_number lower bound' do
        should validate_numericality_of(:student_number).
        is_greater_than_or_equal_to(0)
      end
  
      it 'has a student_number higher bound' do
        should validate_numericality_of(:student_number).
        is_less_than_or_equal_to(10000)
      end
    end
    
    describe "association" do
      it { should belong_to(:school) }
    end
  
    describe "uniqueness" do
      subject { FactoryBot.create(:student) }
      it { should validate_uniqueness_of(:name) }
    end
  
    describe "numericality" do
       it { should validate_numericality_of(:student_number) }
    end 

  end