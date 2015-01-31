require 'test_helper'

class BeamsControllerTest < ActionController::TestCase
  setup do
    @beam = beams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beam" do
    assert_difference('Beam.count') do
      post :create, beam: { angle: @beam.angle, details: @beam.details, done: @beam.done, material: @beam.material, revit_id: @beam.revit_id, section: @beam.section }
    end

    assert_redirected_to beam_path(assigns(:beam))
  end

  test "should show beam" do
    get :show, id: @beam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beam
    assert_response :success
  end

  test "should update beam" do
    patch :update, id: @beam, beam: { angle: @beam.angle, details: @beam.details, done: @beam.done, material: @beam.material, revit_id: @beam.revit_id, section: @beam.section }
    assert_redirected_to beam_path(assigns(:beam))
  end

  test "should destroy beam" do
    assert_difference('Beam.count', -1) do
      delete :destroy, id: @beam
    end

    assert_redirected_to beams_path
  end
end
