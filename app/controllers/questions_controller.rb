class QuestionsController < ApplicationController
  def create
    @question = Question.new(user_id: current_user.id, content: params[:question][:content])
    if @question.save
      # sleep 2
      @answer = Answer.create(question_id: @question.id, content: call_client)
      @answer.content.split("\n")&.map { |element| element.gsub("\n", "") }.reject(&:empty?).each do |task_content|
        Task.create(answer_id: @answer.id, content: task_content)
      end
      redirect_to question_answer_tasks_path(@question, @answer)
    else
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    @answer = Answer.create(question_id: @question.id, content: call_client)
    @answer.content.split("\n")&.map { |element| element.gsub("\n", "") }.reject(&:empty?).each do |task_content|
      Task.create(answer_id: @answer.id, content: task_content)
    end
    redirect_to question_answer_tasks_path(@question, @answer)
  end

  private

  def call_client
    client = OpenAI::Client.new
    response = client.completions(
      parameters: {
        model: "text-davinci-004",
        prompt: "Renvoie moi uniquement sous forme de listes les 5 meilleures solutions écogestes pour faire des economies a la maison : #{@question.content}.",
        max_tokens: 400,
        temperature: 0.5
      }
    )
    response['choices']&.first&.dig('text')
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
