module Api
  module V1
    class APIController < ActionController::API
      include ::ActionController::Serialization
    end
  end
end
