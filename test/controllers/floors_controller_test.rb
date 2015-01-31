require 'test_helper'

class FloorsControllerTest < ActionController::TestCase
  setup do
    @floor = floors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:floors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create floor" do
    assert_difference('Floor.count') do
      post :create, floor: { details: @floor.details, done: @floor.done, floor_type: @floor.floor_type, level_name: @floor.level_name, material: @floor.material, revit_id: @floor.revit_id, thickness: @floor.thickness }
    end

    assert_redirected_to floor_path(assigns(:floor))
  end

  test "should show floor" do
    get :show, id: @floor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @floor
    assert_response :success
  end

  test "should update floor" do
    patch :update, id: @floor, floor: { details: @floor.details, done: @floor.done, floor_type: @floor.floor_type, level_name: @floor.level_name, material: @floor.material, revit_id: @floor.revit_id, thickness: @floor.thickness }
    assert_redirected_to floor_path(assigns(:floor))
  end

  test "should destroy floor" do
    assert_difference('Floor.count', -1) do
      delete :destroy, id: @floor
    end

    assert_redirected_to floors_path
  end
end
