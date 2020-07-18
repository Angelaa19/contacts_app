class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.json.jb"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      date_of_birth: params[:date_of_birth]

    )
    @contact.save
    render "show.json.jb"
  end

  def show
    @contact = Contact.find_by(:id params[:id])
    render "show.json.jb"
  end

  def update
    @contact = Contact.find_by(:id params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.date_of_birth = params[:date_of_birth] || @contact.date_of_birth
    @contact.save
    render "show.json.jb"
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
  end
end
