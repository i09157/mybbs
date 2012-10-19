#encoding: utf-8
Article.transaction do
	(1..100).each do |i|
		Article.create(:id => "#{i}",:variety => "category #{i}",:title => "title #{i}",:name => "user #{i}",:email => "user-#{i}@example.com",
		               :content => "comment #{i}")
	end
end