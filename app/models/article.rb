class Article < ActiveRecord::Base
	validates :title,:name,:content, :presence => true
	has_many :responses, dependent: :destroy
end
