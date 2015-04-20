class QuotesController < ApplicationController
  respond_to :json

  def show
    # random_index = ...
    quote = Quote.find(1)
    json = {body: quote.content}
    render json
  end
end