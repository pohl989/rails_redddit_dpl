class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    if Sub.create(sub_params)
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update

    if @sub.update(sub_params)
      redirect_to @sub
    else
      redirect_to :edit
    end

  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

    def set_sub
      @sub = Sub.find(params[:id])
    end

    def sub_params
      params.require(:sub).permit(:name)
    end

end
