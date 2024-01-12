# frozen_string_literal: true

#  Search controller for search functionality
class SearchController < ApplicationController
  
  def index
    @search = Search.fetch_data_by_ip_group
    render json: { data: @search }
  end
end
