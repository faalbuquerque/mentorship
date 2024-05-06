class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(mentor_params)

    @mentor.save
    redirect_to @mentor
  end

  def show
    @mentor = Mentor.find(params[:id])
  end

  private

  def mentor_params
    params.require(:mentor).permit(:name, :email, :phone, :address)
  end
end
