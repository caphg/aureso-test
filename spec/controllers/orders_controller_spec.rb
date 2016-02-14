require 'rails_helper'

RSpec.describe "/orders", type: :request do
  describe "POST" do
    it "has discount 0 beacuse item not in collection" do
      post "/api/v1/orders.json", {
      	"parameters": {
	      	"order": {
		      	"order_id": 12345,
		      	"email": "test@test.com",
		      	"total_amount_net": "39.00",
		      	"shipping_costs": "29.00",
		      	"payment_method": "VISA",
		      	"items": [{
		      	"name": "item1",
		      	"qnt": 1,
		      	"value": 1100,
		      	"category": "fashion",
		      	"subcategory": "jacket",
		      	"tags": ["tag1", "tag2"],
		      	"collection_id": 42
		      	}]
	      	}
      	}
      }

      expect(json).to eq(
      	{
      	    "id" => 12345,
      	    "email" => "test@test.com",
      	    "total_amount_net" => "39.0",
      	    "shipping_costs" => "29.0",
      	    "payment_method" => "VISA",
      	    "discount_value" => 0,
      	    "items" => [
      	        {
      	            "name" => "item1",
      	            "qnt" => 1,
      	            "value" => 1100,
      	            "category" => "fashion",
      	            "subcategory" => "jacket",
      	            "collection_id" => 42,
      	            "tags" => [
      	                "tag1",
      	                "tag2"
      	            ]
      	        }
      	    ]
      	}
      )
      expect(response.status).to eq(201)
    end
  end
end
