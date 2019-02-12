class BlogsController < ApplicationController
    before_action :set_blog, only: [:show]
    
    def index
        
        @draft_articles = Article.all.draft
        
        @articles = Article.all.published
        @page_description = 'TriBic Software Blog with tech and business articles'
        @page_keywords    = 'blog, tech, articles, business, b2b, software, solution, saas, cloud, small, business, agile'
    end

    def show
        @page_description =  @article.meta_description
        @page_keywords    = @article.tags
    end

    private
    def set_blog
        @article = Article.find(params[:id])
      end

    def blog_params
        params.require(:article).permit(:title, :published_on, :tags, :body, :author, :image, :slug, :meta_description, :meta_title)
      end
end
