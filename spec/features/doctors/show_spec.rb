require 'rails_helper'


RSpec.describe 'Doctor show page' do
  describe 'as a visitor' do
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

      visit "/doctors/#{@doc_1.id}"
    end

    it 'see all doctors info including name, specialty, and education' do
      expect(page).to have_content(@doc_1.name)
      expect(page).to have_content(@doc_1.specialty)
      expect(page).to have_content(@doc_1.education)

      expect(page).to_not have_content(@doc_2.name)
      expect(page).to_not have_content(@doc_2.education)
    end

    it 'see the name of the hospital where they work' do
      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)
    end

    it 'see the names of all the patients this doctor has' do
      expect(page).to have_content("This Doctors Patients:")

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_1.age)
      end
      within "#patient-#{@patient_2.id}" do
        expect(page).to have_content(@patient_2.name)
        expect(page).to have_content(@patient_2.age)
      end
      within "#patient-#{@patient_3.id}" do
        expect(page).to have_content(@patient_3.name)
        expect(page).to have_content(@patient_3.age)
      end

      expect(page).to_not have_content(@patient_4.name)
    end

    it 'see a button next to each patient to remove that patient from doctors caseload' do

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_button("Remove Patient")
      end
      within "#patient-#{@patient_2.id}" do
        expect(page).to have_button("Remove Patient")
      end
      within "#patient-#{@patient_3.id}" do
        expect(page).to have_button("Remove Patient")
      end
    end

    it 'clicking that button brings you back to docs show page and you no longer see that patient on the page' do

      within "#patient-#{@patient_1.id}" do
        click_button("Remove Patient")
      end

      expect(current_path).to eq("/doctors/#{@doc_1.id}")
      expect(page).to_not have_content(@patient_1.name)
    end 
  end
end
