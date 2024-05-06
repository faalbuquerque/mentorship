class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
  end

  def create
    @mentor = Mentor.new(params[:mentor])

    @mentor.save
    redirect_to @mentor
  end

  def show
    @mentor = Mentor.find(params[:id])
  end
end
