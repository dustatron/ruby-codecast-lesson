class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:email]
            
            ContactMailer.contact_email(name, email, body)
            
            
            flash[:success] = "Message Sent."
            redirect_to new_contact_path, notice: "Message Sent."
        else
            flash[:danger] = "Error Occured. Message was not sent."
            redirect_to new_contact_path, notice: "Error!"
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
  

end