class PhonesController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])  #finding the contact by contact_id
    @phone = contact.phones.new   #creating a new instance of the phone object for the contact _id
    render('phones/new.html.erb') #renders phones/new.html page
  end
  def create
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.new(
        :number => params[:number],
        :contact_id => params[:contact_id])
    if @phone.save
      render('phones/phone_success.html.erb')
    else
      render('phones/new.html.erb')
    end
  end

  def edit
    # @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    render('phones/edit.html.erb')
  end


  def update
    @contact = Contact.find(params[:contact_id])
    # @phone = contact.phone
    @phone = Phone.find(params[:id])
    if @phone.update(:number => params[:number])
      render('phones/phone_success.html.erb')
    else
      render('phones/new.html.erb')
    end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    @phone.destroy
    render('phones/destroy.html.erb')
  end
end
