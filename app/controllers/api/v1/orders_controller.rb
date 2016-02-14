module Api
  module V1
    class OrdersController < APIController

      def create
        new_order = Order.new order_params
        begin
          new_order.save!
          render json: OrderSerializer.new(new_order, root: false), status: :created
        rescue => ex
          logger.error ex.message
          render json: {}, status: 422
        end
      end

      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def order_params
        params[:parameters][:order][:items_attributes] = params[:parameters][:order].delete :items
        params.require(:parameters).require(:order).permit(:order_id, :email, :total_amount_net,
        :shipping_costs, :payment_method,
        items_attributes: [:name, :qnt, :value, :category, :collection_id, :subcategory, {tags: []}])
      end
    end
  end
end