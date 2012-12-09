class CreditCardsController < ApplicationController
  def new
    @credit_card = CreditCard.new
  end
end
