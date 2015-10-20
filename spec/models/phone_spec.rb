require 'rails_helper'

describe Phone do
  it "should validate the presence of a phone number" do
    contact_phone = Phone.new({:number => '' })
    expect(contact_phone.save).to eq false
  end
  # it "should validate the presence of a contact_id" do
  #   contact_id = Phone.new({:contact_id => ''})
  #   expect(contact_id.save).to eq false
  # end
  it "should belong_to one contact" do
    a_phone = Phone.new({:number =>'555555'})
    a_contact = Contact.new(:name => 'Bill')
    a_contact.phones << a_phone
    expect(a_phone.contact).to eq a_contact
  end
end
