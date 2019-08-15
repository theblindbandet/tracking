class TrainingsController < ApplicationController
  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      flash[:success] = "Successfully created!"
      redirect_to @training
    else
      render 'new'
    end
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.update_attributes(training_params)
      flash.now[:success] = "Successfully updated!"
      redirect_to @training
    else
      render 'edit'
    end
  end

  private

    def training_params
      params.require(:training).permit(:title, :description, :length)
    end
end
