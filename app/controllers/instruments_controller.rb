class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user

    if @instrument.save
      # No need for app/views/instruments/create.html.erb
      redirect_to instruments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @instrument = Instrument.find(params[:id]) #only this one has view
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_path, status: :see_other

  end

  private

  def instrument_params
    params.require(:instrument).permit(:title, :description, :condition)
  end
end
