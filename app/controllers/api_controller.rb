class ApiController < ApplicationController

  def users
    users = DemoUser.all
    render json: users
  end

  def delete_demo_user
    user = DemoUser.find params[:id]
    user.destroy
    render status: 200, json: { message: "user deleted" }
  end

  def create_demo_user
    user = DemoUser.create(user_params)

    if user.errors.any?
      render status: 401, json: { message: user.errors }
    else
      render status: 200, json: { message: "use created" }
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

  def create_comment
    comment = DemoComment.create(comment_params)

    unless comment.errors.any?
      broadcast
      render status: 201, json: { message: "comment created" }
    else
      render status: 422, json: { message: "comment creation failed" }
    end
  end

  def delete_comment
    comment = DemoComment.find params[:id]
    comment.destroy
    broadcast
    render status: 200, json: { message: "comment deleted" }
  end

  protected

  def broadcast
    ActionCable.server.broadcast("matestack_ui_core", {
      message: "comments_changed"
    })
  end

  def task_params
    params.require(:task).permit(:name, :done)
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
