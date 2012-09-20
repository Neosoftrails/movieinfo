require 'open-uri'
	task :fetch_bollyreviews => :environment do
		@reviews_url = "http://www.nowrunning.com/cgi-bin/rss/reviews_hindi.xml"
		begin
			@reviews_feeds = Feedzirra::Feed.fetch_and_parse(@reviews_url)
			parse_reviewfeed(@reviews_feeds)
		rescue => e
			puts ">>>>>> error at feedzirra feed parsing >>>"
			puts e.message
		end	
	end
		
	def parse_reviewfeed(reviews_feeds)
		begin	
	    	reviews_feeds.entries.each do |f|
				@review = BollywoodReview.new
				@review.title = f.title
				@review.data_url = f.url
				@review.mini_description = f.summary
				@review.category = f.categories.join(',')
				get_detail_review(@review )			
			end
		rescue => e
			puts ">>>> error at for loop & object initailization>>>"
			puts e.message
		end		
	end
	
	def get_detail_review(review)
		begin
			@detail_data = Nokogiri::HTML(open(review.data_url).read)
			#review.description = @detail_data.at_css('#ctl00_ContentPlaceHolder_Middle_ReviewDetailArea').to_html
			#review.description = review.description.gsub(/<br><br>/, "<br>")
			#review.description = review.description.gsub(/<div>(.+)<\/div>/, "")
			review.image_url = 'http://www.nowrunning.com'+ @detail_data.at_css('#ctl00_ContentPlaceHolder_Left_1_MoviePoster')[:src]
			review.rating = @detail_data.at_css('#ctl00_ContentPlaceHolder_Middle_RatingText').text.to_i
			puts review.save!
		rescue => e
			puts ">>> error at nokogiri parsing or db entry >>>"
			puts  e.message
		end	
	end
