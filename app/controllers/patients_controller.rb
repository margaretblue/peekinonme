class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :get_user, except: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    @patients = @user.patients
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    #@patient = @user.patients.find(params[:id])
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
    @patient = @user.patients.new(patient_params)
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        UserMailer.welcome_email(current_user).deliver
        UserMailer.welcome_patient(@patient).deliver
        format.html { redirect_to [@user,@patients], notice: 'Patient was successfully created.' }
        format.json { render json: [@user,@patient], status: :created, location: [@user,@patient] }
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
        format.html { redirect_to [@user, @patient], notice: 'Patient was successfully updated.' }
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
      format.html { redirect_to user_patients_url(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.where(token: params_id).first
    end

    def params_id
      params[:patient_id] || params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :email, :street, :city, :zip, :phone, :condition, :checkintime, :user_id, :token)
    end

    def get_user
      @user = User.find(params[:user_id])
    end

    def restrict_access
      key = Patient.find_by_token(params[:token])
      head :unauthorized unless key
    end
end
