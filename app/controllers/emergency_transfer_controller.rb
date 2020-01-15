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

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Emergency Transfer Summary (Form 34L-D) #{@patient.mr}",
        page_size: "A4",
        template: "emergency_transfer/summary.html.erb",
        layout: "pdf.html",
        orientation: "portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end
end
