class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(allowed_params)
    @deck.save
    redirect_to "/decks"
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update_attributes(allowed_params)
    redirect_to "/decks/#{@deck.id}"
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to "/decks"
  end

  private

  def allowed_params
    params.require(:deck).permit(:name)
  end


end