require 'test_helper'

class PostDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_department = post_departments(:one)
  end

  test "should get index" do
    get post_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_post_department_url
    assert_response :success
  end

  test "should create post_department" do
    assert_difference('PostDepartment.count') do
      post post_departments_url, params: { post_department: { department_id: @post_department.department_id, post_id: @post_department.post_id, worker_id: @post_department.worker_id } }
    end

    assert_redirected_to post_department_url(PostDepartment.last)
  end

  test "should show post_department" do
    get post_department_url(@post_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_department_url(@post_department)
    assert_response :success
  end

  test "should update post_department" do
    patch post_department_url(@post_department), params: { post_department: { department_id: @post_department.department_id, post_id: @post_department.post_id, worker_id: @post_department.worker_id } }
    assert_redirected_to post_department_url(@post_department)
  end

  test "should destroy post_department" do
    assert_difference('PostDepartment.count', -1) do
      delete post_department_url(@post_department)
    end

    assert_redirected_to post_departments_url
  end
end
