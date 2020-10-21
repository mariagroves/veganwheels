class DashboardController < ApplicationController
    def index
        @current_orders = current_user.orders.includes(:restaurant, :delivery, :cart).where(open: true, state: "paid")
        @past_orders = current_user.orders.includes(:restaurant, :delivery, :cart).where(open: false, state: ["paid", "refunded"])
    end
end
