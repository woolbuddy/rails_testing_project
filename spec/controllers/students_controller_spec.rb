require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  before(:each) do 
    @student = FactoryBot.create(:student)
  end

    let(:valid_attributes) {
    { 
      name: 'Adam', 
      student_number: 9000, 
      gpa: 3.75
    }
  }

    let(:invalid_attributes) {
    { 
      name: '', 
      student_number: 9000, 
      gpa: 3.75
    }
  }
  
    describe "GET #index" do
      it "returns http success" do
        get :index, params: { school_id: @student.school_id }
        expect(response).to be_successful
      end
    end
  
    describe "GET #show" do
      it "returns http success" do
        student = @student
        get :show, params: { id: @student.id, school_id: @student.school_id }
        expect(response).to be_successful
      end
    end
  
    describe "GET #new" do
      it "returns http success" do
        get :new, params: { school_id: @student.school_id}
        expect(response).to be_successful
      end
    end
  
    describe "GET #edit" do
      it "returns http success" do
        student = @student
        get :edit, params: { id: @student.id, school_id: @student.school_id }
        expect(response).to be_successful
      end
    end
  
    describe "POST #create" do
      context "with valid params" do
        it "creates a new student" do
          expect {
            post :create, params: { student: valid_attributes, school_id: @student.school_id }
          }.to change(Student, :count).by(1)
        end
  
        it "redirects to the created student" do
          post :create, params: { student: valid_attributes, school_id: @student.school_id }
          expect(response).to redirect_to(Student.last)
        end
      end
  
       context "with invalid params" do
        it "does not creates a new student" do
          expect {
            post :create, params: { student: invalid_attributes, school_id: @student.school_id }
          }.to change(Student, :count).by(0)
        end
  
        it "redirects to new template" do
          post :create, params: { student: invalid_attributes, school_id: @student.school_id }
          expect(response).to be_successful
        end
      end
    end
  
    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { name: 'Ryan' }
        }
  
        it "update the student" do
          student = @student
          put :update, params: {id: @student.id, student: new_attributes, school_id: @student.school_id }
          student.reload
          expect(student.name).to eq(new_attributes[:name])
        end
  
        it "redirect to the student updated" do
          student = @student
          put :update, params: {id: @student.id, student: valid_attributes, school_id: @student.school_id }
          expect(response).to redirect_to(student)
        end
      end
  
      context "with invalid params" do
        it "does not update the student" do
          student = @student
          put :update, params: {id: @student.id, student: invalid_attributes, school_id: @student.school_id }
          student.reload
          expect(student.name).to_not eq(invalid_attributes[:name])
        end
  
        it "redirect to the edit form" do
          student = @student
          put :update, params: {id: @student.id, student: invalid_attributes, school_id: @student.school_id }
          expect(response).to be_successful
        end
      end
    end
  
     describe "DELETE #destroy" do
      it "destroys the requested student" do
        student = @student
        expect {
          delete :destroy, params: { id: @student.id, school_id: @student.school_id }
        }.to change(Student, :count).by(-1)
      end
  
      it "redirects to the student list" do
        student = @student
        delete :destroy, params: { id: @student.id, school_id: @student.school_id }
        expect(response).to redirect_to(students_url)
      end
    end
  
  end