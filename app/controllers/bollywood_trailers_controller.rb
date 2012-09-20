class BollywoodTrailersController < ApplicationController
  # GET /bollywood_trailers
  # GET /bollywood_trailers.json
  def index
    @bollywood_trailers = BollywoodTrailer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bollywood_trailers }
    end
  end

  # GET /bollywood_trailers/1
  # GET /bollywood_trailers/1.json
  def show
    @bollywood_trailer = BollywoodTrailer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bollywood_trailer }
    end
  end

  # GET /bollywood_trailers/new
  # GET /bollywood_trailers/new.json
  def new
    @bollywood_trailer = BollywoodTrailer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bollywood_trailer }
    end
  end

  # GET /bollywood_trailers/1/edit
  def edit
    @bollywood_trailer = BollywoodTrailer.find(params[:id])
  end

  # POST /bollywood_trailers
  # POST /bollywood_trailers.json
  def create
    @bollywood_trailer = BollywoodTrailer.new(params[:bollywood_trailer])

    respond_to do |format|
      if @bollywood_trailer.save
        format.html { redirect_to @bollywood_trailer, notice: 'Bollywood trailer was successfully created.' }
        format.json { render json: @bollywood_trailer, status: :created, location: @bollywood_trailer }
      else
        format.html { render action: "new" }
        format.json { render json: @bollywood_trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bollywood_trailers/1
  # PUT /bollywood_trailers/1.json
  def update
    @bollywood_trailer = BollywoodTrailer.find(params[:id])

    respond_to do |format|
      if @bollywood_trailer.update_attributes(params[:bollywood_trailer])
        format.html { redirect_to @bollywood_trailer, notice: 'Bollywood trailer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bollywood_trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bollywood_trailers/1
  # DELETE /bollywood_trailers/1.json
  def destroy
    @bollywood_trailer = BollywoodTrailer.find(params[:id])
    @bollywood_trailer.destroy

    respond_to do |format|
      format.html { redirect_to bollywood_trailers_url }
      format.json { head :no_content }
    end
  end
end
