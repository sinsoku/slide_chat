class CommentsController < ApplicationController

  def index
    @comments = slide.comments.order('page_number ASC')
  end

  def create
    @comment = slide.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.slide, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment.slide }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def slide
      @slide ||= Slide.find_by!(id: params[:slide_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :slide_id, :page_number)
    end
end
