class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])    # @ ειναι instance variable  για να μπορω να την χρησιμοποιησω και στο view moy 
    end                                         # to params[:id] einai ena hash kai to pairnw apo to URL: localhost3000/articles/1    opou 1 to id 
    def index
        @articles = Article.all 
    end
    def new 
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
       if  @article.save 
            flash[:notice] = "Article was created successfully"
        redirect_to @article   #kanonika einai redirect_to article_path(@article) alla xrisimopoeitai toso suxna poy h ruby exei suntomografia gia auto
       else
        render 'new'
       end
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])        #apo to URL pare to id pou briskomaste twra 
      if   @article.update(params.require(:article).permit(:title, :description))    # kane article update () me to params.require pairnw pali to articles apo to URL kai kanw permit ta 2 auta pedia na ginoun updated 
            flash[:notice] = "Article was updated successfully"             # bgazw ena mhnuma an ola pane kala oti egine epityxhs ananewsh 
            redirect_to @article    
      else
            render 'edit'                              # an oxi render pali thn edit selida(ksanafortwse thn)
     end
    end
    
    def destroy
        @article = Article.find(params[:id]) 
        @article.destroy
        redirect_to articles_path
    end
end
