class BollywoodPreviewsController < ApplicationController
  # GET /bollywood_previews
  # GET /bollywood_previews.json
  def index
    @bollywood_previews = BollywoodPreview.paginate(:page => params[:page], :per_page => 10)
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bollywood_previews }
    end
  end

  # GET /bollywood_previews/1
  # GET /bollywood_previews/1.json
  def show
    @bollywood_preview = BollywoodPreview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bollywood_preview }
    end
  end

  # GET /bollywood_previews/new
  # GET /bollywood_previews/new.json
  def new
    @bollywood_preview = BollywoodPreview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bollywood_preview }
    end
  end

  # GET /bollywood_previews/1/edit
  def edit
    @bollywood_preview = BollywoodPreview.find(params[:id])
  end

  # POST /bollywood_previews
  # POST /bollywood_previews.json
  def create
    @bollywood_preview = BollywoodPreview.new(params[:bollywood_preview])

    respond_to do |format|
      if @bollywood_preview.save
        format.html { redirect_to @bollywood_preview, notice: 'Bollywood preview was successfully created.' }
        format.json { render json: @bollywood_preview, status: :created, location: @bollywood_preview }
      else
        format.html { render action: "new" }
        format.json { render json: @bollywood_preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bollywood_previews/1
  # PUT /bollywood_previews/1.json
  def update
    @bollywood_preview = BollywoodPreview.find(params[:id])

    respond_to do |format|
      if @bollywood_preview.update_attributes(params[:bollywood_preview])
        format.html { redirect_to @bollywood_preview, notice: 'Bollywood preview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bollywood_preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bollywood_previews/1
  # DELETE /bollywood_previews/1.json
  def destroy
    @bollywood_preview = BollywoodPreview.find(params[:id])
    @bollywood_preview.destroy

    respond_to do |format|
      format.html { redirect_to bollywood_previews_url }
      format.json { head :no_content }
    end
  end
end
