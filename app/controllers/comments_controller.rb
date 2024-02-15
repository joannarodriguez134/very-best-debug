class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.author_id = params.fetch("query_author_id")
    @comment.venue_id = params.fetch("query_venue_id")
    @comment.body = params.fetch("query_body")
    if @comment.commenter.valid?
      @comment.save
      redirect_to("/venues/#{@comment.venue_id}")
    else
      redirect_to("/venues/#{@comment.venue_id}")
    end
  end
end
