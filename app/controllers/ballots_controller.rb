class BallotsController < ApplicationController
  before_filter :get_user

  def get_user
    @user = User.find(params[:user_id])
  end

  def show
    @ballot = @user.ballots.find(params[:id])
  end

  def new
    @ballot = Ballot.new
    @categories = ['Apparel', 'Boating Accessory', 'Boat', 'Combo', 'Electronics', 'Eyewear', 'Fishing Accessory', 'Fishmart Tackle', 'Fly Fishing Accessory', 'Fly Reel', 'Fly Rod', 'Footwear', 'Freshwater Reel', 'Freshwater Rod', 'Giftware', 'Kids Tackle', 'Line', 'Hard Lure', 'Soft Lure', 'Saltwater Reel', 'Saltwater Rod', 'Tackle Management', 'Technical Apparel', 'Terminal Tackle'] 
    t = String.new( "A" )
    @hsh = Hash.new
    @categories.each do |cat| 
      ary = Array.new
      for i in "001".."099"
        ary.push(t+i)
      end
      @hsh[cat] = ary
      t = t.next
    end
  end

  def create
    @ballot = @user.build_ballot(params[:ballot_params])
    if @ballot.save
      flash[:notice] = "Successfully created ballot"
      redirect_to root_url 
    else
      render :action => 'new'
    end
  end

  private

  def person_params
    params.require(:ballot).permit(:category1)
  end

end
