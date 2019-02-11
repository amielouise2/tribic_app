class ArticlesController < ApplicationController
  before_action :authenticate_model!
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :archive, :revive]
  before_action :destroy_old_attachments, only: [:update]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
     
    respond_to do |format|
      if @article.published!
        format.html { redirect_to articles_path, notice: 'article was successfully published.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    
      respond_to do |format|
        if @article.archived!
        format.html { redirect_to articles_url, notice: 'Article was successfully archived.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end

  def revive
    
    respond_to do |format|
      if @article.draft!
        format.html { redirect_to articles_url, notice: 'Article was successfully revived.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :published_on, :tags, :body, :author, :image, :slug, :meta_description, :meta_title)
    end

    def destroy_old_attachments
    
      if params[:image]
          image_uri1 = URI.parse @event.image.service_url
      end
      if params[:small_image]
          image_uri2 = URI.parse @event.small_image.service_url
      end

      if image_uri1 == "eventx.storage.googleapis.com"
          image_path1 = image_uri.path.sub("/", "")
          file = Event.storage_bucket.file image_path1
          file.delete
      end
      if image_uri2 == "eventx.storage.googleapis.com"
          image_path2 = image_uri.path.sub("/", "")
          file = Event.storage_bucket.file image_path2
          file.delete
      end
     
  end
end
