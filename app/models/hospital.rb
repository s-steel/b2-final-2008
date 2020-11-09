class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end
end
