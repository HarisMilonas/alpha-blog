class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]      #gia na mporei na diabasei prwta thn methodo kai meta na paei ston kwdika

    def show
           
    end                                        
    def index
        @articles = Article.all 
    end
    def new 
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first          # BAZOUME HARD CODE ENA USER MEXRI NA FTIAKSOUME AUTHENTICATION SYSTEM
       if  @article.save 
            flash[:notice] = "Article was created successfully"
        redirect_to @article   #kanonika einai redirect_to article_path(@article) alla xrisimopoeitai toso suxna poy h ruby exei suntomografia gia auto
       else
        render 'new'
       end
    end

    def edit  
    end

    def update
      if   @article.update(article_params)    # kane article update () me to params.require pairnw pali to articles apo to URL kai kanw permit ta 2 auta pedia na ginoun updated 
            flash[:notice] = "Article was updated successfully"             # bgazw ena mhnuma an ola pane kala oti egine epityxhs ananewsh 
            redirect_to @article    
      else
            render 'edit'                              # an oxi render pali thn edit selida(ksanafortwse thn)
     end
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end


    private  # oi methodoi autoi einai private


    def set_article
     @article = Article.find(params[:id])  # @ ειναι instance variable  για να μπορω να την χρησιμοποιησω και στο view moy
    end                                      # to params[:id] einai ena hash kai to pairnw apo to URL: localhost3000/articles/1    opou 1 to id 

    def article_params
        params.require(:article).permit(:title, :description)
    end

end


