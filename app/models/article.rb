class Article < ActiveRecord::Base
	validates :title,:name,:content, :presence => true
end
