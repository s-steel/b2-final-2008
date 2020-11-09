class PatientsController < ApplicationController

  def remove
    patient = Patient.find(params[:id])
    doctor = Doctor.find(params[:doctor_id])
    doctor.remove_patient(patient)
    redirect_to "/doctors/#{doctor.id}"
  end

  def index
    @patients = Patient.all
  end
end
