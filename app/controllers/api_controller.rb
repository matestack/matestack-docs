class ApiController < ApplicationController

  def delete_demo_user
    user = DemoUser.find params[:id]
    user.destroy
    render status: 200, json: { message: "success" }
  end

  def create_demo_user
    user = DemoUser.create(user_params)

    if user.errors.any?
      render status: 401, json: { message: user.errors }
    else
      render status: 200, json: { message: "success" }
    end
  end

  def update_task
    task = DemoTask.find params[:id]
    task.update(task_params)

    unless task.errors.any?
      render status: 200, json: { message: "task updated" }
    else
      render status: 422, json: { message: "task update failed" }
    end
  end

  def create_task
    task = DemoTask.create(task_params)

    unless task.errors.any?
      render status: 201, json: { message: "task created" }
    else
      render status: 422, json: { message: "task creation failed" }
    end
  end

  protected

  def task_params
    params.require(:task).permit(:name, :done)
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
