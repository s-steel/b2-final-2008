class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.alphabetical_names
    order(:name).pluck(:name)
  end
end
