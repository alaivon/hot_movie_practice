namespace :dev do
	task :types => :environment do 
		desc "build movie types"
		types = ["Action", "Comedy", "Romantic", "Horror", "Science Fiction", "Suspense", "Drama"]
		types.each do |i|
			category = Category.new
			category.name = i
			category.save
			puts "Complete"
		end
	end
end	


