class CrawlerSessionsController < ApplicationController
  before_action :set_crawler_session, only: [:show, :edit, :update, :destroy]

  # GET /crawler_sessions
  # GET /crawler_sessions.json
  def index
    @crawler_sessions = CrawlerSession.paginate(page: params[:page])
  end

  # GET /crawler_sessions/1
  # GET /crawler_sessions/1.json
  def show
    id = params[:id].to_i
    @url_histories = UrlHistory.where(crawler_session_id: id)
    @url_histories_prev = UrlHistory.where(crawler_session_id: (id - 1) )
  end

  # GET /crawler_sessions/new
  def new
    @crawler_session = CrawlerSession.new
  end

  # GET /crawler_sessions/1/edit
  def edit
  end

  # POST /crawler_sessions
  # POST /crawler_sessions.json
  def create
    @crawler_session = CrawlerSession.new(crawler_session_params)

    respond_to do |format|
      if @crawler_session.save
        format.html { redirect_to @crawler_session, notice: 'Crawler session was successfully created.' }
        format.json { render :show, status: :created, location: @crawler_session }
      else
        format.html { render :new }
        format.json { render json: @crawler_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawler_sessions/1
  # PATCH/PUT /crawler_sessions/1.json
  def update
    respond_to do |format|
      if @crawler_session.update(crawler_session_params)
        format.html { redirect_to @crawler_session, notice: 'Crawler session was successfully updated.' }
        format.json { render :show, status: :ok, location: @crawler_session }
      else
        format.html { render :edit }
        format.json { render json: @crawler_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawler_sessions/1
  # DELETE /crawler_sessions/1.json
  def destroy
    @crawler_session.destroy
    respond_to do |format|
      format.html { redirect_to crawler_sessions_url, notice: 'Crawler session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawler_session
      @crawler_session = CrawlerSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawler_session_params
      params.require(:crawler_session).permit(:start_time, :end_time)
    end
end
