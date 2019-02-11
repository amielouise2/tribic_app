class BlogsController < ApplicationController
    before_action :set_blog, only: [:show]
    def index
        @articles = Article.all.published
        @page_description = 'TriBic Software Blog with tech and business articles'
        @page_keywords    = 'blog, tech, articles, business, b2b, software, solution, saas, cloud, small, business, agile'
    end

    def show
        @page_description = 'Are you a small business looking to streamline your business processe.'
        @page_keywords    = 'tribic, halifax, professional, services, software, solution, saas, cloud, small, business, agile'
    end

    private
    def set_blog
        @article = Article.find(params[:id])
      end

    def blog_params
        params.require(:article).permit(:title, :published_on, :tags, :body, :author, :image, :slug, :meta_description, :meta_title)
      end
end
