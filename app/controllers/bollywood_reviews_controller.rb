class BollywoodReviewsController < ApplicationController
  # GET /bollywood_reviews
  # GET /bollywood_reviews.json
  def index
    @bollywood_reviews = BollywoodReview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bollywood_reviews }
    end
  end

  # GET /bollywood_reviews/1
  # GET /bollywood_reviews/1.json
  def show
    @bollywood_review = BollywoodReview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bollywood_review }
    end
  end

  # GET /bollywood_reviews/new
  # GET /bollywood_reviews/new.json
  def new
    @bollywood_review = BollywoodReview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bollywood_review }
    end
  end

  # GET /bollywood_reviews/1/edit
  def edit
    @bollywood_review = BollywoodReview.find(params[:id])
  end

  # POST /bollywood_reviews
  # POST /bollywood_reviews.json
  def create
    @bollywood_review = BollywoodReview.new(params[:bollywood_review])

    respond_to do |format|
      if @bollywood_review.save
        format.html { redirect_to @bollywood_review, notice: 'Bollywood review was successfully created.' }
        format.json { render json: @bollywood_review, status: :created, location: @bollywood_review }
      else
        format.html { render action: "new" }
        format.json { render json: @bollywood_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bollywood_reviews/1
  # PUT /bollywood_reviews/1.json
  def update
    @bollywood_review = BollywoodReview.find(params[:id])

    respond_to do |format|
      if @bollywood_review.update_attributes(params[:bollywood_review])
        format.html { redirect_to @bollywood_review, notice: 'Bollywood review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bollywood_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bollywood_reviews/1
  # DELETE /bollywood_reviews/1.json
  def destroy
    @bollywood_review = BollywoodReview.find(params[:id])
    @bollywood_review.destroy

    respond_to do |format|
      format.html { redirect_to bollywood_reviews_url }
      format.json { head :no_content }
    end
  end
end
