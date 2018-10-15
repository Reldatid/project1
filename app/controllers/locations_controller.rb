class LocationsController < ApplicationController

  before_action :check_if_logged_in

  def create
  end

  def new
  end

  def show
    grab_tree
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
  end

  def destroy
    location = Location.find params[:id]
    parent = location.environment
    location.destroy
    redirect_to location_path(parent)
  end

  def test
    params[:id] = 35
    grab_tree
    render json: @jscript_tree
  end


  def grab_tree
    @location = Location.find params[:id]
    @branch = [];
    treetop = @location
    while treetop.environment != nil do
      @branch << treetop
      treetop = treetop.environment
    end
    @universe = treetop
    if @universe.landmarks.present?
      tree_hash = @universe.generate_tree(@universe)
    end
    @jscript_tree = tree_hash.to_json.html_safe
  end
end
