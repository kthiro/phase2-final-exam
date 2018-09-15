class MonologuesController < ApplicationController
  
  before_action :set_monologue, only: [:edit, :update, :destroy]
  
  def new
    if params[:back]
      @monologue = Monologue.new(monologue_params)
    else
      @monologue = Monologue.new
    end
  end

  def confirm
    @monologue = Monologue.new(monologue_params)
    render 'new' if @monologue.invalid?
  end
  
  def create
    @monologue = Monologue.new(monologue_params)
    @monologue.save
    redirect_to monologues_path, notice: 'ひとりごとを作成しました！'
  end

  def index
    @monologues = Monologue.all
  end

  def edit
  end
  
  def update
    if @monologue.update(monologue_params)
      redirect_to monologues_path, notice: 'ひとりごとを編集しました！'
    else
      render 'edit'
    end
  end
  
  def destroy
    @monologue.destroy
    redirect_to monologues_path, notice: 'ひとりごとを削除しました！'
  end
  
  private
  
  def monologue_params
    params.require(:monologue).permit(:content)
  end
  
  def set_monologue
    @monologue = Monologue.find(params[:id])
  end
  
end
