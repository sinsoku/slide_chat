class CommentsController < ApplicationController
  include ActionController::Live

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

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    redis = Redis.new

    redis.subscribe("#{params[:slide_id]}.new_comment") do |on|
      on.message do |event, data|
        sse.write(data)
      end
    end
  ensure
    response.stream.close
  end

  private
    def slide
      @slide ||= Slide.find_by!(id: params[:slide_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :slide_id, :page_number)
    end
end
