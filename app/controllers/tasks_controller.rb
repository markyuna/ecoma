class TasksController < ApplicationController
  before_action :set_answer, only: %i[create new index]
  before_action :set_question, only: %i[create new index]
  before_action :set_task, only: %i[update destroy]

  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Tasks", template: "tasks/index", layout: "pdf"   # Excluding ".pdf" extension.
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(status: !@task.status)
    head :no_content
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to question_answer_tasks_path(@task.answer.question_id, @task.answer_id)
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
