require 'rails_helper'


RSpec.describe 'Hospital show page' do
  describe 'as a visitor' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')
      @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
      @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Stanford University')
      @doc_3 = @hospital_1.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', education: 'Stanford University')
      @doc_4 = @hospital_2.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvania')
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_1.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_2.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_1.id, patient_id: @patient_3.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_1.id)
      @patient_doctor_1 = PatientDoctor.create!(doctor_id: @doc_2.id, patient_id: @patient_4.id)

      visit "/hospitals/#{@hospital_1.id}"
    end

    it 'see the hospitals name' do
      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)
    end

    it 'see the number of doctors that work at this hospital' do
      expect(page).to have_content("Number of Doctors that work at this Hospital: #{@hospital_1.doctors.length}")

      expect(page).to have_content("Name of Doctors at the Hospital:")

      within "#doctor-#{@doc_1.id}" do
        expect(page).to have_content(@doc_1.name)
      end
      within "#doctor-#{@doc_2.id}" do
        expect(page).to have_content(@doc_2.name)
      end
      within "#doctor-#{@doc_3.id}" do
        expect(page).to have_content(@doc_3.name)
      end
    end

    it 'see a unique list of universities that the doctors attended'
  end
end
