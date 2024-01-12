# frozen_string_literal: true

#  Search controller for search functionality
class SearchController < ApplicationController
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
    return unless many_words?(words)

    searches = join_words(words)
    lang = detect_language(searches, linguo_api)
    return unless english?(lang)

    Search.create(term: searches, ip: request.remote_ip)
  end

  def many_words?(words)
    words.length > 4
  end

  def join_words?(words)
    words.join(' ')
  end

  def detect_language(searches, linguo_api)
    Linguo.detect(searches, linguo_api).detections.map { |x| x['language'] if x['confidence'] > 0.3 }.compact
  end

  def english?(lang)
    lang == ['en']
  end
end
