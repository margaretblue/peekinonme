class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]
  before_action :get_patient, except: [:show, :edit, :destroy]
  before_action :authenticate_user!

  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = @patient.checkins
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
  end

  # GET /checkins/new
  def new
    @checkin = Checkin.new
  end

  # GET /checkins/1/edit
  def edit
  end

  # POST /checkins
  # POST /checkins.json
  def create
    @checkin = @patient.checkins.new(checkin_params)
    #@checkin.patient_id = current_user.id
    respond_to do |format|
      if @checkin.save
        format.html { redirect_to [@patients, @checkin], notice: 'Checkin was successfully created.' }
        format.json { render json: [@patients, @checkin], status: :created, location: [@patients, @checkin] }
      else
        format.html { render action: 'new' }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkins/1
  # PATCH/PUT /checkins/1.json
  def update
    respond_to do |format|
      if @checkin.update(checkin_params)
        #@checkin.patient_id = current_user.id
        format.html { redirect_to [@patient, @checkin], notice: 'Checkin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to patient_checkins_url(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkin_params
      params.require(:checkin).permit(:patient_id, :message)
    end

    def get_patient
      @patient = Patient.find(params[:patient_id])
    end
end
