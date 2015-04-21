module Api
  module V0
    class QuotesController < ApplicationController
      respond_to :json
      before_action :set_headers, only: :show
      before_action :get_random_quote, only: :show

      def show
      end

      private

      def get_random_quote
        random_index = Random.rand(1..quotes.count) - 1
        @quote = quotes[random_index]
      end

      def quotes
        config = Rails.application.config
        config.quotes = Quote.all.to_a if config.quotes.empty?
        config.quotes
      end

      def set_headers
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Last-Modified'] = (Time.now - 1.second).httpdate
      end
    end
  end
end
