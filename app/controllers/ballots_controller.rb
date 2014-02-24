class BallotsController < ApplicationController

  def show
    @ballot = @ballots.find(params[:id])
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
    @ballot = Ballots.new(params[:ballot])
    @ballot.user = current_user
    if @ballot.save
      flash[:notice] = "Successfully created ballot"
      redirect_to root_url 
    else
      render :action => 'new'
    end
  end

end
