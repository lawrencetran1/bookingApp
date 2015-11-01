class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    timeslot = Timeslot.find(params[:guest][:timeslot_id])

    if ( (35 - timeslot.guest_count.to_i) - params[:guest][:plus_one].to_i ) < 0

      redirect_to users_path

    else
      @guest = Guest.new(guest_params)
      @guest.save

      last_guest = Guest.last
      guest_timeslot = last_guest.timeslot
      guest_timeslot.guest_count += 1 + last_guest.plus_one

      respond_to do |format|
        if guest_timeslot.save
          format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
          format.json { render :show, status: :ok, location: @guest }
        else
          format.html { redirect_to new_guest_path, notice: 'Not enough slots.' }
          format.json { render json: @guest.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    guest = Guest.find(params[:id])
    guest_timeslot = guest.timeslot
    guest_timeslot.guest_count -= 1 + guest.plus_one
    guest_timeslot.save!

    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :email, :plus_one, :timeslot_id)
    end
end
