require 'rails_helper'

describe Contact do
  it 'is valid with a firstname, lastname and email' do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com'
    )
    expect(contact).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it 'is invalid without a lastname' do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it 'is invalid without a email address' do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email adress' do
    Contact.create(
      firstname: 'Joe',
      lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact = Contact.create(
      firstname: 'Jane',
      lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end
  it 'it returns a contact\'s full name as a string'
end
