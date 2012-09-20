require 'open-uri'
	task :fetch_bollytrailers => :environment do
		@reviews_url = "http://www.nowrunning.com/cgi-bin/rss/trailers_hindi.xml"
		begin
			@trailers_raw_data = Nokogiri::XML(open(@reviews_url).read)
			@trailers_raw_data.css('item').each do |item|
				@bollywood_trailer = BollywoodTrailer.new
				@bollywood_trailer.title = item.at_css('title').text
				@bollywood_trailer.description = item.at_css('description').text rescue nil
				@bollywood_trailer.data_url = item.at_css('link').text
				@bollywood_trailer.thumb_url = item.at_xpath('media:thumbnail')[:url]
				@bollywood_trailer.category = item.at_css('category').text
			    get_video_url(@bollywood_trailer)
			end
		rescue => e
			puts ">>>>>> error at nokogiri feed parsing >>>"
			puts e
		end
	end
	
	def get_video_url(bollywood_trailer)
		@video_url
		begin
		@trailer_page = Nokogiri::HTML(open(bollywood_trailer.data_url).read)
		@flashdata =  @trailer_page.at_css('#ctl00_ContentPlaceHolder_Middle1_ctl01_FlashContent object embed')
		if @flashdata.nil?
		   bollywood_trailer.video_url = @trailer_page.at_css('#ctl00_ContentPlaceHolder_Middle1_PlayerContainer iframe')[:src]
		else
		    @data = @flashdata[:flashvars]
			bollywood_trailer.video_url = @data[@data.index('url')+6..@data.index('autoPlay')-4]
		end   
		rescue => e
			puts e
		end
		puts bollywood_trailer.save!
		puts bollywood_trailer.inspect
	end
