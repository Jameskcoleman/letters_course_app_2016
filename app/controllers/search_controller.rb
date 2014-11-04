class SearchController < ApplicationController
  def index
    @posts = PostRepository.new(params).search
  end
end