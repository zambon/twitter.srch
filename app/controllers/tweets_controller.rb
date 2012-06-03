class TweetsController < ApplicationController
  
  before_filter :get_latest_queries
  
  # GET /
  def index
    @query = Query.new
  end
  
  # POST /tweets/search
  def search
    @query = Query.existing_or_new(params[:query])
    @query.updated_at = Time.now
    @tweets = Tweet.parse(@query.results) if @query.save
  end
  
  private
  
  def get_latest_queries
    @queries = Query.order('updated_at DESC').limit(7)
  end
  
end
