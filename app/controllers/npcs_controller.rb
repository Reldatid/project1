class NpcsController < ApplicationController

  def new
    @npc = Npc.new
    @location = Location.find params[:location]
  end

  def create
    puts "="*50
    puts npc_params
    @npc = Npc.new (npc_params)
    @npc.user_id = @npc.location.user_id
    @npc.save
    redirect_to location_path(@npc.location_id)
  end

  def index
  end

  def edit
    @npc = Npc.find( params[:id])
    @location = Location.find params[:location]
  end

  def update
    @npc = Npc.find( params[:id])
    @npc.update( npc_params )
    redirect_to location_path(@npc.location_id)
  end

  def delete
  end

  def npc_params
    params.require(:npc).permit(:name, :title, :description, :location_id)
  end
end
