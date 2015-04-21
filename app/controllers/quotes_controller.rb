class QuotesController < ApplicationController
  respond_to :json

  def show
    id = Random.rand(1..Quote.count)
    quote = Quote.find(id)
    json = {body: quote.content}
    render json
  end
end