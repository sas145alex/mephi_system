require 'test_helper'

class TaskWorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_worker = task_workers(:one)
  end

  test "should get index" do
    get task_workers_url
    assert_response :success
  end

  test "should get new" do
    get new_task_worker_url
    assert_response :success
  end

  test "should create task_worker" do
    assert_difference('TaskWorker.count') do
      post task_workers_url, params: { task_worker: { answer: @task_worker.answer, comment: @task_worker.comment, finish_date: @task_worker.finish_date, receive_date: @task_worker.receive_date, status: @task_worker.status, task_id: @task_worker.task_id, worker_id: @task_worker.worker_id } }
    end

    assert_redirected_to task_worker_url(TaskWorker.last)
  end

  test "should show task_worker" do
    get task_worker_url(@task_worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_worker_url(@task_worker)
    assert_response :success
  end

  test "should update task_worker" do
    patch task_worker_url(@task_worker), params: { task_worker: { answer: @task_worker.answer, comment: @task_worker.comment, finish_date: @task_worker.finish_date, receive_date: @task_worker.receive_date, status: @task_worker.status, task_id: @task_worker.task_id, worker_id: @task_worker.worker_id } }
    assert_redirected_to task_worker_url(@task_worker)
  end

  test "should destroy task_worker" do
    assert_difference('TaskWorker.count', -1) do
      delete task_worker_url(@task_worker)
    end

    assert_redirected_to task_workers_url
  end
end
