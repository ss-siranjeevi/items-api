class ApplicationController < ActionController::Base

    before_action :initialize_session
    before_action :load_cart

    def initialize_session
        session[:cart] ||= []
    end

    def load_cart
        @cart = Item.find(session[:cart])
    end
end
