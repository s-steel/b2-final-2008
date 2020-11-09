require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :patient_doctors}
    it { should have_many(:doctors).through(:patient_doctors)}
  end

  describe 'Class methods' do
    before :each do
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
    end

    it '#alphabetical_names' do
      expect(Patient.alphabetical_names).to eq([@patient_2.name, @patient_1.name, @patient_3.name, @patient_4.name])
    end
  end
end
