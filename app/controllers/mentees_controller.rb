class MenteesController < ApplicationController
  before_action :set_mentee, only: [:edit, :update, :show, :destroy]

  def index
    @mentees = Mentee.all
  end

  def show
    @mentee
  end

  def new
    @mentee = Mentee.new
  end  

  def create
    @mentee = Mentee.new(mentee_params)

    if @mentee.save
      redirect_to @mentee
    else
      render :new, status: :unprocessable_entity
    end  
  end

  def edit
    @mentee
  end

  def update
    if @mentee.update(mentee_params)
      redirect_to @mentee
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def destroy
    @mentee.destroy

    redirect_to mentees_path, status: :see_other
  end

  private

  def mentee_params
    params.require(:mentee).permit(:name, :email, :bio)
  end

  def set_mentee
    @mentee = Mentee.find(params[:id])
  end
end
