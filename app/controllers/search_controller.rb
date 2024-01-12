#  Search controller for search functionality
class SearchController < ApplicationController
  def index
  end

  def result
    if params[:query].present?
      @param = params[:query].downcase
      search_params(@param)
      @articles = Article.where('lower(title) LIKE ?', "%#{@param}%").pluck(:title)
      print @articles.inspect
      render json: { data: @articles }
    else
      render json: { data: ['No search term'] }
    end
  end

  private

  def search_params(params)
    linguo_api = 'caf5d3b41c2b5d1ae3a0626d51acd223'
    words = params.split(' ')
    if words.length > 4
      searches = words.join(' ')
      lang = Linguo.detect(searches, linguo_api).detections.map { |x| x['language'] if x['confidence'] > 0.3 }.compact
      puts lang.inspect
      if lang == ["en"]
        puts 'English'
        Search.create(term: searches, ip: request.remote_ip)
      end
    end
  end
end
