class SearchController < ApplicationController
  def index
    @user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
  end
end
