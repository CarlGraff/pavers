require 'test_helper'

class PaversControllerTest < ActionController::TestCase
  setup do
    @paver = pavers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pavers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paver" do
    assert_difference('Paver.count') do
      post :create, paver: { Col: @paver.Col, Line1: @paver.Line1, Line2: @paver.Line2, Line3: @paver.Line3, Line4: @paver.Line4, Name: @paver.Name, Paver: @paver.Paver, Placement: @paver.Placement, Row: @paver.Row }
    end

    assert_redirected_to paver_path(assigns(:paver))
  end

  test "should show paver" do
    get :show, id: @paver
    assert_response :success
  end
  

  test "should get edit" do
    get :edit, id: @paver
    assert_response :success
  end

  test "should update paver" do
    patch :update, id: @paver, paver: { Col: @paver.Col, Line1: @paver.Line1, Line2: @paver.Line2, Line3: @paver.Line3, Line4: @paver.Line4, Name: @paver.Name, Paver: @paver.Paver, Placement: @paver.Placement, Row: @paver.Row }
    assert_redirected_to paver_path(assigns(:paver))
  end

  test "should destroy paver" do
    assert_difference('Paver.count', -1) do
      delete :destroy, id: @paver
    end

    assert_redirected_to pavers_path
  end
end
