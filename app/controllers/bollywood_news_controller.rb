class BollywoodNewsController < ApplicationController
  # GET /bollywood_news
  # GET /bollywood_news.json
  def index
    @bollywood_news = BollywoodNews.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bollywood_news }
    end
  end

  # GET /bollywood_news/1
  # GET /bollywood_news/1.json
  def show
    @bollywood_news = BollywoodNews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bollywood_news }
    end
  end

  # GET /bollywood_news/new
  # GET /bollywood_news/new.json
  def new
    @bollywood_news = BollywoodNews.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bollywood_news }
    end
  end

  # GET /bollywood_news/1/edit
  def edit
    @bollywood_news = BollywoodNews.find(params[:id])
  end

  # POST /bollywood_news
  # POST /bollywood_news.json
  def create
    @bollywood_news = BollywoodNews.new(params[:bollywood_news])

    respond_to do |format|
      if @bollywood_news.save
        format.html { redirect_to @bollywood_news, notice: 'Bollywood news was successfully created.' }
        format.json { render json: @bollywood_news, status: :created, location: @bollywood_news }
      else
        format.html { render action: "new" }
        format.json { render json: @bollywood_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bollywood_news/1
  # PUT /bollywood_news/1.json
  def update
    @bollywood_news = BollywoodNews.find(params[:id])

    respond_to do |format|
      if @bollywood_news.update_attributes(params[:bollywood_news])
        format.html { redirect_to @bollywood_news, notice: 'Bollywood news was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bollywood_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bollywood_news/1
  # DELETE /bollywood_news/1.json
  def destroy
    @bollywood_news = BollywoodNews.find(params[:id])
    @bollywood_news.destroy

    respond_to do |format|
      format.html { redirect_to bollywood_news_index_url }
      format.json { head :no_content }
    end
  end
end
