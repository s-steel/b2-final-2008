require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should belong_to :hospital}
    it { should have_many :patient_doctors}
    it { should have_many(:patients).through(:patient_doctors)}
  end

  describe 'Instance methods' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')
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
    end

    it '.remove_patient' do
      expect(Patient.all).to eq([@patient_1, @patient_2, @patient_3, @patient_4])

      expect(@doc_1.patients).to eq([@patient_1, @patient_2, @patient_3])
      @doc_1.remove_patient(@patient_2)
      expect(@doc_1.patients).to eq([@patient_1, @patient_3])

      expect(@doc_2.patients).to eq([@patient_1, @patient_4])
      @doc_2.remove_patient(@patient_4)
      expect(@doc_2.patients).to eq([@patient_1])

      expect(Patient.all).to eq([@patient_1, @patient_2, @patient_3, @patient_4])
      #these tests are to confirm that a patient is not deleted from the database,
      #just removed from one of the doctors
    end
  end
end
