class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venues/venue_list" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venues/details" })
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    if @venue.valid?
      @venue.save
      redirect_to("/venues/#{@venue.id}", allow_other_host: true)
    else
      redirect_to("/venues/#{@venue.id}", allow_other_host: true)
    end
  end
  
  def update
    the_id = params.fetch("the_id")

    @venue = Venue.where({ :id => the_id }).at(0)
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    if @venue.valid?
      @venue.save
      redirect_to("/venues/#{@venue.id}")
    else
      redirect_to("/venues/#{@venue.id}")
    end
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    @the_venue = matching_venues.at(0)
    @the_venue.destroy

    redirect_to("/venues")
  end

end
