class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def doctors_unique_educations
    doctors.distinct.pluck(:education)
  end
end
