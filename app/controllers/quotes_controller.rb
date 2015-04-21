class QuotesController < ApplicationController
  respond_to :json

  def show
    count = Quote.count
    id = Random.rand(1..count)
    quote = Quote.find(id)
    json = { body: quote.content }
    response.headers['Access-Control-Allow-Origin'] = '*'
    puts response
    render json
  end
end