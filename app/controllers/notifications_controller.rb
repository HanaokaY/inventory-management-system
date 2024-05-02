class NotificationsController < ApplicationController
    def index
        @notifications = Notification.all
        render json: @notifications
    end

    def update
        @notification = Notification.find(params[:id])

        if @notification.update(notification_params)
            render json: @notification
        else
            render json: @notification.errors, status: :unprocessable_entity
        end
    end
    
    private

    def notification_params
        params.require(:notification).permit(:product_id, :message, :status, :notification_date)
    end
end
