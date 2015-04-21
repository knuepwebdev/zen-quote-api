module Api
  module V0
    class QuotesController < ApplicationController
      respond_to :json

      def show
        id = Random.rand(1..quotes.count)
        quote = quotes[id - 1]
        json = { body: quote.content }
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Last-Modified'] = (Time.now - 1.second).httpdate
        render json
      end

      private

      def quotes
        config = Rails.application.config
        config.quotes = Quote.all.to_a if config.quotes.empty?
        config.quotes
      end
    end
  end
end
