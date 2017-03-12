require 'test_helper'

class PaverAppsControllerTest < ActionController::TestCase
  setup do
    @paver_app = paver_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paver_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paver_app" do
    assert_difference('PaverApp.count') do
      post :create, paver_app: { Col: @paver_app.Col, Line1: @paver_app.Line1, Line2: @paver_app.Line2, Line3: @paver_app.Line3, Line4: @paver_app.Line4, Name: @paver_app.Name, Paver: @paver_app.Paver, Placement: @paver_app.Placement, Row: @paver_app.Row }
    end

    assert_redirected_to paver_app_path(assigns(:paver_app))
  end

  test "should show paver_app" do
    get :show, id: @paver_app
    assert_response :success
  end
  

  test "should get edit" do
    get :edit, id: @paver_app
    assert_response :success
  end

  test "should update paver_app" do
    patch :update, id: @paver_app, paver_app: { Col: @paver_app.Col, Line1: @paver_app.Line1, Line2: @paver_app.Line2, Line3: @paver_app.Line3, Line4: @paver_app.Line4, Name: @paver_app.Name, Paver: @paver_app.Paver, Placement: @paver_app.Placement, Row: @paver_app.Row }
    assert_redirected_to paver_app_path(assigns(:paver_app))
  end

  test "should destroy paver_app" do
    assert_difference('PaverApp.count', -1) do
      delete :destroy, id: @paver_app
    end

    assert_redirected_to paver_apps_path
  end
end
