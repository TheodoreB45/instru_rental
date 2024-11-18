class InstrumentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument = current_user

    if @instrument.save
    # No need for app/views/instruments/create.html.erb
      redirect_to instruments_path
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:title, :description, :condition)
  end
end
