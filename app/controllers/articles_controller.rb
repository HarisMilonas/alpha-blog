class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])    # @ ειναι instance variable  για να μπορω να την χρησιμοποιησω και στο view moy 
    end                                         # to params[:id] einai ena hash kai to pairnw apo to URL: localhost3000/articles/1    opou 1 to id 
    def index
        @articles = Article.all 
    end
    def new 

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        redirect_to @article   #kanonika einai redirect_to article_path(@article) alla xrisimopoeitai toso suxna poy h ruby exei suntomografia gia auto
    end
end
