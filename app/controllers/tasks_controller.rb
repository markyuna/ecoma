class TasksController < ApplicationController
  before_action :set_answer, only: %i[create new index]
  before_action :set_question, only: %i[create new index]
  before_action :set_task, only: %i[destroy update]

  def index
    @tasks = Task.all
  end

  def destroy
    @task.destroy
    redirect_to question_answer_tasks_path(@question, @answer)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(status: params[:status])
    @answer = @task.answer
    @question = @answer.question
    @progress = @answer.tasks.where(status: true).count * 20

    respond_to do |format|
      format.html { redirect_to question_answer_tasks_path(@question, @answer) }
      format.js
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:status)
  end
end
