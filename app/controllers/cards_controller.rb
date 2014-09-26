class CardsController < ApplicationController

  before_filter :authenticate

  def show
    @deck = find_deck
    @card = @deck.cards.find(params[:id])
  end

  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create
    @deck = find_deck
    @card = @deck.cards.new(allowed_params)
    @card.save
    redirect_to @deck
  end

  def edit
    @deck = find_deck
    @card = find_card(@deck)
  end

  def update
    @deck = find_deck
    @card = find_card(@deck)
    @card.update_attributes(allowed_params)
    redirect_to @deck
  end

  def destroy
    @deck = find_deck
    @card = find_card(@deck)
    @card.destroy
    redirect_to @deck
  end

  private

  def find_deck
    current_user.decks.find(params[:deck_id])
  end

  def find_card deck
    deck.cards.find(params[:id])
  end

  def allowed_params
    params.require(:card).permit(:front, :back)
  end

end