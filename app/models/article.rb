class Article < ApplicationRecord # me auto ton tropo exw kateutheian getters kai setters gia ton pinaka moy 
    belongs_to :user    #one to only one association
    validates :title, presence: true, length: {minimum: 6, maximum: 100}  #title not null ousiastika
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
end

