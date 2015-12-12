class UrlHistoriesController < ApplicationController
  before_action :set_url_history, only: [:show, :edit, :update, :destroy]

  # GET /url_histories
  # GET /url_histories.json
  def index
    @url_histories = UrlHistory.includes(:crawler_session).paginate(page: params[:page])
  end

  # GET /url_histories/1
  # GET /url_histories/1.json
  def show
  end

  # GET /url_histories/new
  def new
    @url_history = UrlHistory.new
  end

  # GET /url_histories/1/edit
  def edit
  end

  # POST /url_histories
  # POST /url_histories.json
  def create
    @url_history = UrlHistory.new(url_history_params)

    respond_to do |format|
      if @url_history.save
        format.html { redirect_to @url_history, notice: 'Url history was successfully created.' }
        format.json { render :show, status: :created, location: @url_history }
      else
        format.html { render :new }
        format.json { render json: @url_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_histories/1
  # PATCH/PUT /url_histories/1.json
  def update
    respond_to do |format|
      if @url_history.update(url_history_params)
        format.html { redirect_to @url_history, notice: 'Url history was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_history }
      else
        format.html { render :edit }
        format.json { render json: @url_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_histories/1
  # DELETE /url_histories/1.json
  def destroy
    @url_history.destroy
    respond_to do |format|
      format.html { redirect_to url_histories_url, notice: 'Url history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_history
      @url_history = UrlHistory.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_history_params
      params.require(:url_history).permit(:crawler_session_id, :url, :image_path, :diff_to_previous)
    end
end
