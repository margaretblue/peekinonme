require "test_helper"

class CheckinsControllerTest < ActionController::TestCase

  before do
    @checkin = checkins(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:checkins)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Checkin.count') do
      post :create, checkin: {  }
    end

    assert_redirected_to checkin_path(assigns(:checkin))
  end

  def test_show
    get :show, id: @checkin
    assert_response :success
  end

  def test_edit
    get :edit, id: @checkin
    assert_response :success
  end

  def test_update
    put :update, id: @checkin, checkin: {  }
    assert_redirected_to checkin_path(assigns(:checkin))
  end

  def test_destroy
    assert_difference('Checkin.count', -1) do
      delete :destroy, id: @checkin
    end

    assert_redirected_to checkins_path
  end
end
