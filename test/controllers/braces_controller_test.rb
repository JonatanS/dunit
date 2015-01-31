require 'test_helper'

class BracesControllerTest < ActionController::TestCase
  setup do
    @brace = braces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:braces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brace" do
    assert_difference('Brace.count') do
      post :create, brace: { angle: @brace.angle, details: @brace.details, done: @brace.done, material: @brace.material, revit_id: @brace.revit_id, section: @brace.section }
    end

    assert_redirected_to brace_path(assigns(:brace))
  end

  test "should show brace" do
    get :show, id: @brace
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brace
    assert_response :success
  end

  test "should update brace" do
    patch :update, id: @brace, brace: { angle: @brace.angle, details: @brace.details, done: @brace.done, material: @brace.material, revit_id: @brace.revit_id, section: @brace.section }
    assert_redirected_to brace_path(assigns(:brace))
  end

  test "should destroy brace" do
    assert_difference('Brace.count', -1) do
      delete :destroy, id: @brace
    end

    assert_redirected_to braces_path
  end
end
