module Api
  module V0
    class QuotesController < ApplicationController
      respond_to :json

      def show
        id = Random.rand(1..Quote.count)
        quote = Quote.find(id)
        json = { body: quote.content }
        response.headers['Access-Control-Allow-Origin'] = '*'
        render json
      end
    end
  end
end
