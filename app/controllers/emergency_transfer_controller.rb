class EmergencyTransferController < ApplicationController

  def index
    @facilities = Facility.all
  end

  def patients_list
    @facility = Facility.find(params[:id])
    @patients = Patient.all
  end

  def summary
    @facility = Facility.find(params[:facility_id])
    @patient = Patient.find(params[:patient_id])
    @emergency_transfer = EmergencyTransfer.new(@facility, @patient)
  end
end
