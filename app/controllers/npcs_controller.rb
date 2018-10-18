class NpcsController < ApplicationController

  def new
    @npc = Npc.new
  end

  def create

  end

  def index
  end

  def edit
    @npc = Npc.find( params[:id])
  end

  def update

  end

  def delete
  end
end
