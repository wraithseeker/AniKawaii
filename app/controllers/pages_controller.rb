class PagesController < ApplicationController

	
	def index
		#For some reason per_page is -2 the actual number
		@animegif = Animegif.paginate(:page => params[:page], :per_page => 12).order('created_at DESC')
		##Post.page(params[:page]).order('created_at DESC')	
	end

	def random
		@animegif = Animegif.limit(12).order("RANDOM()")
	end

	def search
		@animegif = Animegif.search_by_name(params[:search])
	end

	def ratingsort
		@animegif = Animegif.paginate(:page => params[:page], :per_page => 12).order('score DESC')
	end

	# API

	def dota2main
 		@item = ApiDota.where(:api_type => 'dota2_wallpaper').limit(250).order("RANDOM()")
 		render json: @item, root: false,each_serializer: ApiDotasSerializer
	end
 
 	def dota2icon
 		@item = ApiDota.where(:api_type => 'dota2_icon')
 		render json: @item, root: false,each_serializer: ApiDotasSerializer
 	end
 
	def dota2icon_all
 		@item = ApiDota.where(:api_type => 'dota2_category_images')
 		render json: @item, root: false,each_serializer: ApiDotasSerializer
 	end

 	def dota2_popular
 		@item = ApiDota.where(:api_type => 'dota2_popular').limit(250).order("RANDOM()")
 		render json: @item, root: false,each_serializer: ApiDotasSerializer
 	end
 
	def lolmain
		@item = ApiLol.where(:api_type => 'main').limit(250).order("RANDOM()")
		render json: @item, root: false,each_serializer: ApiLolsSerializer
	end

	def lolfanart
		@item = ApiLol.where(:api_type => 'fanart').limit(250).order("RANDOM()")
		render json: @item, root: false,each_serializer: ApiLolsSerializer
	end

	def lolrandom
		@item = ApiLol.limit(500).order("RANDOM()")
		render json: @item, root: false,each_serializer: ApiLolsSerializer
	end
	
	# END API #
end
