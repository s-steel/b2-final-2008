require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors}
  end

  describe 'Instance methods' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @hospital_2 = Hospital.create!(name: 'Seaside Health & Wellness Center')
      @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
      @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Stanford University')
      @doc_3 = @hospital_1.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', education: 'Stanford University')
      @doc_4 = @hospital_2.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvania')
      @doc_5 = @hospital_2.doctors.create!(name: 'Slick Rick', specialty: 'The Ladies', education: 'University of Pennsylvania')
    end

    it '.doctor_count' do
      expect(@hospital_1.doctor_count).to eq(@hospital_1.doctors.length)
      expect(@hospital_2.doctor_count).to eq(@hospital_2.doctors.length)
    end

    it '.doctors_unique_educations' do
      expect(@hosptial_1.doctors_unique_educations).to eq("#{@doc_1.education}, #{@doc_2.education}")
      expect(@hosptial_2.doctors_unique_educations).to eq("#{@doc_4.education}")
    end
  end
end
