class QuestionsController < ApplicationController
  def create
    @question = Question.new(user_id: current_user.id, content: params[:question][:content])
    @question.user = current_user
    if @question.save
      sleep 2
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
<<<<<<< HEAD
        model: "text-davinci-001",
        prompt: "Renvoie moi uniquement sous forme de listes les 5 meilleures solutions simple d'automédication autre qu'avec des médicaments pour soigner ces symptômes : #{@question.content}.",
        max_tokens: 300,
        temperature: 0.5,
=======
        model: "text-davinci-002",
        prompt: "#{@question.content}, renvoie moi un array de 5 meilleures ecogestes pour reduire ma consumation energetique",
        max_tokens: 300
>>>>>>> 58f4d0c1eab6984a7a92f69560cd70e40a54d62e
      }
    )
    response['choices']&.first&.dig('text')
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
