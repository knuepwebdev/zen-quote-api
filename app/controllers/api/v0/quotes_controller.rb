module Api
  module V0
    class QuotesController < ApplicationController
      respond_to :json

      def show
        id = Random.rand(1..4)
        quote = Rails.application.config.quotes[id - 1]
        json = { body: quote.content }
        response.headers['Access-Control-Allow-Origin'] = '*'
        puts 'my_config**'
        puts Rails.application.config.quotes
        puts 'my_config**'
        render json
      end
    end
  end
end
