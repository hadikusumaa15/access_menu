class ArticlesController < ApplicationController
    before_action  respond_to :json
    def index
    # render json: Article.all, only: [:id]
    render json: Article.all, each_serializer: ArticleSerializer, root: false
    #    respond_with @articles = Article.all
    end
    
      def show
        @article = Article.find(params[:id])
        respond_to do |format|
          format.html
          format.json { render json: @article }
        end
      end
      
      # def default_serializer_options
      #   {root: false}
      # end
end
