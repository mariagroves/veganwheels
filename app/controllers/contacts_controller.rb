class ContactsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]

    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
            flash[:notice] = "Your message was sent! We will be in touch soon."
            redirect_to root_path
        else
            flash[:error] = 'Sorry, the message cannot be sent at the moment.'
            render :new
        end
    end
end
