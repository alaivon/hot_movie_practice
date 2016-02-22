namespace :dev do
	desc "build movie types"
	task :types => :environment do 
		types = ["Action", "Comedy", "Romantic", "Horror", "Science Fiction", "Suspense", "Drama"]
		types.each do |i|
			category = Category.new
			category.name = i
			category.save
			puts "Complete"
		end
	end
end	


