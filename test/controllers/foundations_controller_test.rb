require 'test_helper'

class FoundationsControllerTest < ActionController::TestCase
  setup do
    @foundation = foundations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foundations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foundation" do
    assert_difference('Foundation.count') do
      post :create, foundation: { details: @foundation.details, done: @foundation.done, foundation_type: @foundation.foundation_type, material: @foundation.material, revit_id: @foundation.revit_id, rotation: @foundation.rotation }
    end

    assert_redirected_to foundation_path(assigns(:foundation))
  end

  test "should show foundation" do
    get :show, id: @foundation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foundation
    assert_response :success
  end

  test "should update foundation" do
    patch :update, id: @foundation, foundation: { details: @foundation.details, done: @foundation.done, foundation_type: @foundation.foundation_type, material: @foundation.material, revit_id: @foundation.revit_id, rotation: @foundation.rotation }
    assert_redirected_to foundation_path(assigns(:foundation))
  end

  test "should destroy foundation" do
    assert_difference('Foundation.count', -1) do
      delete :destroy, id: @foundation
    end

    assert_redirected_to foundations_path
  end
end
