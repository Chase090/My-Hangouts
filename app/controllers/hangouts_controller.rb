class HangoutsController < ApplicationController

  def index
    @hangouts = Hangout.all
  end

  def show
    @hangout = Hangout.find(params[:id])
    @owner = @hangout.owner
    @notinvited = @owner.friends - @hangout.guests
  end

  def new
    @hangout = Hangout.new
  end

  def add_guests
    @hangout = Hangout.find(params[:id])
    @friendstoinvite_ids = params[:hangout][:guest_ids]
    @friendstoinvite_ids.each do |f_id|
      if f_id != ""#needed because the first of the arrays is always blank for some reason
      @hangout.guests << User.find(f_id)
      end

      # @hangout.guest_ids << f_id -- MUST FIGURE OUT - why doesn't it work with id's? i thought it did
    end
    redirect_to @hangout
  end


  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.owner = User.find(current_user_id)
    if @hangout.valid?
      @hangout.save
      redirect_to @hangout
    else
      flash[:error] = @hangout.errors.full_messages
      redirect_to new_hangout_path
    end
  end

  def edit
    @hangout = Hangout.find(params[:id])
  end

  def update
    @hangout = Hangout.find(params[:id])
    if @hangout.update(hangout_params) #same as - if valid? pretty sure .update will save ; not sure how else to do this
      redirect_to @hangout
    else
      flash[:error] = @hangout.errors.full_messages
      redirect_to edit_hangout_path(@hangout)
    end
  end

  def destroy
    @hangout = Hangout.find(params[:id])
    @hangout.destroy
  end

private

  def hangout_params
    params.require(:hangout).permit(:title, :location, :date, :owner, :notes=>[])
  end

end
