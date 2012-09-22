require 'open-uri'
	task :fetch_bollynews => :environment do
		@news_url = "http://www.nowrunning.com/cgi-bin/rss/news_hindi.xml"
		begin
			@news_feeds = Feedzirra::Feed.fetch_and_parse(@news_url)
			parse_newsfeed(@news_feeds)
		rescue => e
			puts ">>>>>> error at feedzirra feed parsing >>>"
			puts e.message
		end	
	end
		
	def parse_newsfeed(news_feeds)
		begin	
	    	news_feeds.entries.each do |f|
				@news_item = BollywoodNews.new
				@news_item.title = f.title
				@news_item.data_url = f.url
				@news_item.category = f.categories.join(',')
				get_detail_news(@news_item,f)			
			end
		rescue => e
			puts ">>>> error at for loop & object initailization>>>"
			puts e.message
		end		
	end
	
	def get_detail_news(news_item,feed)
		begin
			puts news_item.data_url
			@detail_data = Nokogiri::HTML(open(URI.encode(news_item.data_url)).read)
			@description = @detail_data.at_css('#ctl00_ContentPlaceHolderMainContent_ctl00_ArticleDetail')
			if !@description.nil?
				news_item.description = @description.to_html
			else
				news_item.description = feed.summary
			end		
			news_item.description = news_item.description.gsub(/<br><br>/, "<br>")
			news_item.description = news_item.description.gsub(/<div>(.+)<\/div>/, "")
			news_item.image_url = @detail_data.at_css('#ctl00_ContentPlaceHolderMainContent_ctl00_ImageBox img')[:src] rescue nil
			puts news_item.save!
		rescue => e
			puts ">>> error at nokogiri parsing or db entry >>>"
			puts  e.message
		end	
	end
