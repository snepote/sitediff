require 'sitemap-parser'
require 'screencap'

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
    @url_histories = UrlHistory.where(crawler_session_id: id).paginate(page: params[:page])
    @url_histories_prev = UrlHistory.where(crawler_session_id: (id - 1) ).paginate(page: params[:page])
  end

  # GET /crawler_sessions/new
  def new
    start_time = DateTime.now
    urls = []
    sitemap = SitemapParser.new 'https://www.helpling.de/sitemap.xml'
    sitemap.urls.to_a.each do |url|
      urls << url.at('loc').content
    end
    urls.uniq!
    @crawler_session = CrawlerSession.create!(
        start_time: start_time,
        end_time: DateTime.now
    )

    urls.each do |url|
      @url_history = UrlHistory.new(
          crawler_session_id: @crawler_session.id,
          url: url
      )
      @url_history.save
    end

    # @url_history_image = UrlHistory.where( crawler_session_id: @crawler_session.id).first
    #
    # f = Screencap::Fetcher.new(@url_history_image.url)
    # image_url = @url_history_image.url
    # replacements = [ ["https://www.", ""], ["/", ""] ]
    # replacements.each {|replacement| image_url.gsub!(replacement[0], replacement[1])}
    # screenshot = f.fetch( :output => image_url)
    # @url_history_image.update_attributes( :image_path => Rails.root.join( 'app',
    #                                                                       'assets',
    #                                                                       'images',
    #                                                                       'screenshots',
    #                                                                       start_time.strftime('%Q'),
    #                                                                       "#{image_url.strip}.png") )
    # @url_history_image.save

    redirect_to crawler_sessions_url
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
