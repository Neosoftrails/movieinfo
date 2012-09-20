require 'open-uri'
	task :fetch_bollypreviews => :environment do
		@previews_url = "http://www.nowrunning.com/cgi-bin/rss/previews_hindi.xml"
		begin
			@previews_feeds = Feedzirra::Feed.fetch_and_parse(@previews_url)
			parse_previewfeed(@previews_feeds)
		rescue => e
			puts ">>>>>> error at feedzirra feed parsing >>>"
			puts e.message
		end	
	end
		
	def parse_previewfeed(previews_feeds)
		begin	
	    	previews_feeds.entries.each do |f|
				@preview = BollywoodPreview.new
				@preview.title = f.title
				@preview.data_url = f.url
				@preview.category = f.categories.join(',')
				puts @preview.inspect
				get_detail_preview(@preview )			
			end
		rescue => e
			puts ">>>> error at for loop & object initailization>>>"
			puts e.message
		end		
	end
	
	def get_detail_preview(preview)
		begin
		    puts 'dasdasdsasdasd'
			@detail_data = Nokogiri::HTML(open(preview.data_url).read)
			preview.description = @detail_data.at_css('#ctl00_ContentPlaceHolder_Middle_Preview').to_html
			preview.description = preview.description.gsub(/<br><br>/, "<br>")
			preview.description = preview.description.gsub(/<div>(.+)<\/div>/, "")
			preview.image_url = @detail_data.at_css('#ctl00_ContentPlaceHolder_Left_1_MoviePoster')[:src]
			puts preview.save!
		rescue => e
			puts ">>> error at nokogiri parsing or db entry >>>"
			puts  e.message
		end	
	end
