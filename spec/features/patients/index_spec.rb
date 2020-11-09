require 'rails_helper'


RSpec.describe 'Patients index page' do
  describe 'as a visitor' do
    before :each do
      @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      @patient_4 = Patient.create!(name: 'Zola Shepherd', age: 2)
      visit '/patients'
    end

    it 'see list of all patients in alphabetical order' do
      expect(page.text.index(@patient_2.name)).to be < page.text.index(@patient_1.name)
      expect(page.text.index(@patient_1.name)).to be < page.text.index(@patient_3.name)
      expect(page.text.index(@patient_3.name)).to be < page.text.index(@patient_4.name)
    end
  end
end
