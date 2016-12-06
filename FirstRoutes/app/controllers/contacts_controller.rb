class ContactsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    @contacts = user.contacts + user.available_contacts
    render json: @contacts
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    if @contact.update(contacts_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contacts_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
