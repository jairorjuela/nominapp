module Api
  module V1
    class RandomArraysController < ApplicationController

      def create
        response = RandomArrays::Create::Do.new.(create_params)

        if response.success?
          render json:  response.success, status: 201
        else
          render json:  response.failure, status: 401
        end
      end

      private
      def create_params
        params
          .permit(:number_of_elements)
          .to_h
          .symbolize_keys
          .tap do |whitelisted|
            whitelisted[:number_of_elements] = whitelisted[:number_of_elements].to_i
          end
      end
    end
  end
end
