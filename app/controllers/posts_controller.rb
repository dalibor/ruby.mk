class PostsController < ApplicationController

  def index
    @posts = scope.order('published_at DESC').includes([:tags, :editor]).
               where('published_at IS NOT NULL').
               paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html
      format.rss { render :layout => false}
    end
  end

  def show
    @post = Post.where('published_at IS NOT NULL').find(params[:id])
  end

  private
    def scope
      if params[:tag].present? && (@tag = Tag.find_by_name(params[:tag]))
        @tag.posts
      elsif params[:editor].present? && (@editor = Editor.find(params[:editor]))
        @editor.posts
      elsif params[:year].present? && params[:month].present?
        @month = "#{Date::MONTHNAMES[params[:month].to_i]} #{params[:year]}"
        Post.where("YEAR(published_at) = ? AND MONTH(published_at) = ?",
                   params[:year], params[:month])
      else
        Post
      end
    end
end
