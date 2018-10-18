class LocationsController < ApplicationController

  before_action :check_if_logged_in

  def create
    @location = Location.new( location_params )
    @location.user_id = Location.find_by(:name => params[:location][:universe]).user_id
    @location.branch = params[:location][:branch]+','+@location.name
    @location.save
    redirect_to location_path(@location)
  end

  def create_universe
    @location = Location.new( location_params )
    @location.universe = @location.name
    @location.branch = @location.name
    @location.save
    @current_user.locations << @location
    redirect_to user_path(@current_user)
  end

  def new_universe
    @location = Location.new
  end

  def new
    @location = Location.new
    if params[:universe] == nil
      redirect_to "/locations/new_universe"
    else
      @universe = params[:universe]
      @branch = params[:branch]
      puts "="*100
    end
  end

  def show
    grab_tree
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    dm_notes = @location.dm_notes
    @location.update location_params
    if @current_user.id != @location.user_id
      @location.dm_notes = dm_notes
    end
    @location.save
    redirect_to location_path(@location)
  end

  def destroy
    location = Location.find params[:id]
    parent = location.environment
    destroy_with_children(location)
    if (parent.nil?)
      redirect_to user_path(@current_user)
    else
      redirect_to location_path(parent)
    end
  end

  private

  def destroy_with_children(location)
    if location.landmarks.any?
      location.landmarks.each do |landmark|
        destroy_with_children(landmark)
      end
    end
    location.destroy
  end

  def location_params
    params.require(:location).permit(:name, :variety, :description, :environment_id, :visible, :universe, :public_notes, :dm_notes)
  end

  def grab_root_location(id)
    @location = Location.find id
    @branch = [];
    @treetop = @location
    while @treetop.environment != nil do
      @branch << @treetop
      @treetop = @treetop.environment
    end
  end

  def grab_tree
    grab_root_location(params[:id])
    @universe = @treetop
    if @universe.landmarks.present?
      tree_hash = @universe.generate_tree(@universe)
    end
    @jscript_tree = tree_hash.to_json.html_safe
  end
end
