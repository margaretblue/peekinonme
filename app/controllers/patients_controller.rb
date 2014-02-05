class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :get_caregiver

  # GET /patients
  # GET /patients.json
  def index
    @patients = @caregiver.patients
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = @caregiver.patients.find(params[:id])
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = @caregiver.patients.new(patient_params)
    @patient.caregiver_id = current_user.id

    respond_to do |format|
      if @patient.save
        UserMailer.welcome_email(current_user).deliver
        UserMailer.welcome_patient(@patient).deliver
        format.html { redirect_to [@caregiver,@patient], notice: 'Patient was successfully created.' }
        format.json { render json: [@caregiver, @patient], status: :created, location: [@caregiver, @patient] }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to [@caregiver, @patient], notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to user_patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :email, :street, :city, :zip, :phone, :condition, :checkintime, :caregiver_id)
    end

    def get_caregiver
      @caregiver = User.find(params[:user_id])
    end
end
