class Response < ActiveRecord::Base
	belongs_to :article
	validates :name,:content, :presence => true
	after_create :update_article #レスしたあと記事の更新日時も変更する
	def update_article
		unless email == "sage" then
		self.article.updated_at = Time.now
		self.article.save
	  end
	end
end
