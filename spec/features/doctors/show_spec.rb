require 'rails_helper'


RSpec.describe 'Doctor show page' do
  describe 'as a visitor' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
      @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University')
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_1.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_2.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_3.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_1.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_4.id)

      visit "/doctors/#{@doc_1.id}"
    end


  end
end
