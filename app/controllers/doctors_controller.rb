class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    @patients = @doctor.patients
    @hospital = Hospital.find(@doctor.hospital_id)
  end
end
