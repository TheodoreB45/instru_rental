class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
    if params[:query].present?
      @instruments = @instruments.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @instrument = Instrument.find(params[:id]) #only this one has view
    @instruments = Instrument.all
    @booking = Booking.new
    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude
      }
    end
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
    redirect_to profile_path, status: :see_other
  end

  private

  def instrument_params
    params.require(:instrument).permit(:title, :description, :condition, :available_from, :available_until, :price_per_day, :address)
  end
end
