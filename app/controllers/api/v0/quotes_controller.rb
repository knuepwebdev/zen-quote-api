module Api
  module V0
    class QuotesController < ApplicationController
      respond_to :json

      def show
        id = Random.rand(1..quotes.count)
        quote = quotes[id - 1]
        json = { body: quote.content }
        response.headers['Access-Control-Allow-Origin'] = '*'
        render json
      end

      private

      def quotes
        Rails.application.config.quotes.to_a
      end
    end
  end
end
