class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])    # @ ειναι instance variable  για να μπορω να την χρησιμοποιησω και στο view moy 
    end                                         # to params[:id] einai ena hash kai to pairnw apo to URL: localhost3000/articles/1    opou 1 to id 



end
