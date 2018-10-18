class LocationsController < ApplicationController

  before_action :check_if_logged_in

  def new
    @location = Location.new
    if params[:location] == nil
      redirect_to "/locations/new_universe"
    else
      @environment = params[:location]
    end
  end

  def new_universe
    @location = Location.new
  end

  def create
    @location = Location.new( location_params )
    @location.user_id = @location.environment.user_id
    @location.universe = @location.environment.universe
    @location.branch = @location.environment.branch+','+@location.name
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

  def show
    grab_tree
    unless params[:npc].nil?
      @npc = Npc.find params[:npc]
    end
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    dm_notes = @location.dm_notes
    @location.update location_params

    environment = Location.find(@location.environment_id)
    branch_arr = environment.branch.split(',')
    branch_arr.each do |place|
      if place == @location.name
        flash[:error] = "Don't choose a child landmark as a parent location!"
        redirect_to edit_location_path(@location) and return
      end
    end
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
