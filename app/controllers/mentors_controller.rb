class MentorsController < ApplicationController

  def new
    @mentor = Mentor.new
  end

  def index
    @mentors = Mentor.all
  end

  def edit
    @mentor = Mentor.find(params[:id])
  end

  def show
    @mentor = Mentor.find(params[:id])
  end

  def create
    @mentor = Mentor.new(mentors_params)

    if @mentor.save
      render json: @mentor, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def mentors_params
    params.require(:mentor).permit(:name, :email, :url, :bio)
  end
end