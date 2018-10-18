class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.json.jbuilder"
  end

  def create
    @contacts = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name]
      )
    @contacts.save
    render "show.json.jbuilder"
  end

  def show
    @contacts = Contact.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @contacts = Contact.find_by(id: params[:id])
    @contacts.first_name = params[first_name] || @contacts.first_name
    @contacts.last_name = params[last_name] || @contacts.last_name
    render "show.json.jbuilder"
  end

  def destroy
    @contacts = Contact.find_by(id: params[:id])
    contact.destroy
    render json: {message: "Contact succesfully destroyed"}
  end

end
