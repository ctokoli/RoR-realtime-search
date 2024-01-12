class SearchController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search(params[:query], fields: [:title], operator: "or", match: :word_start)
      print @articles.inspect
      render json: @articles
    end
    # @user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
  end

  def result
    @param = params[:query].downcase
    @articles = Article.where('lower(title) LIKE ?', "%#{@param}%").pluck(:title)
    print @articles.inspect
    render json: @articles
  end
end
