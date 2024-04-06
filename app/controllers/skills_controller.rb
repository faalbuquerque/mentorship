class SkillsController < ApplicationController
  before_action :set_skill, only: [:edit, :update, :show, :destroy]

  def index
    @skill = Skill.all
  end

  def show
    @skill
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    
    if @skill.save
      redirect_to @skill
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @skill
  end

  def update
    if @skill.update(skill_params)
      redirect_to @skill
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy

    redirect_to skills_path, status: :see_other
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
