module Api
	module V1
  		class ItemsController < APIController
  			def create
        		new_item = Item.new item_params
        		new_item.save!
        		render json: ItemSerializer.new(new_item, root: false)
      		end

	      	private
	      	# Never trust parameters from the scary internet, only allow the white list through.
	      	def item_params
	        	params.permit(:name, :qnt, :value, :category, :collection_id, :subcategory, :tags => [])
	  		end
	  	end
  	end
end
