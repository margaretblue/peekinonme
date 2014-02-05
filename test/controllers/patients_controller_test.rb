require "test_helper"

class PatientsControllerTest < ActionController::TestCase

  before do
    @patient = patients(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Patient.count') do
      post :create, patient: {  }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  def test_show
    get :show, id: @patient
    assert_response :success
  end

  def test_edit
    get :edit, id: @patient
    assert_response :success
  end

  def test_update
    put :update, id: @patient, patient: {  }
    assert_redirected_to patient_path(assigns(:patient))
  end

  def test_destroy
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
