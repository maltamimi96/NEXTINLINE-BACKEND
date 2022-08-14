require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'validation tests' do
    before(:each) do
      @user = User.create(
        email: 'test@example.com',
        username: 'Ray',
        password: 'password'
      )
      @store = Store.create(
        name: 'Hello World Store',
        location: 'Melbourne',
        user_id: @user.id,
        domain: 'www.example.com'
      )
    end

    context 'creation' do
      it 'should create a new client if details provided are valid' do
        client = Client.new(
          first_name: 'John',
          last_name: 'Doe',
          phone: '0366666666',
          email: 'test@example.com',
          store_id: @store.id
        ).save
        expect(client).to be(true)
      end

      it "ensures a client's first name" do
        client = Client.new(
          last_name: 'Doe',
          phone: '0366666666',
          email: 'test@example.com',
          store_id: @store.id
        ).save
        expect(client).to be(false)
      end

      it "ensures a client's last name" do
        client = Client.new(
          first_name: 'John',
          phone: '0366666666',
          email: 'test@example.com',
          store_id: @store.id
        ).save
        expect(client).to be(false)
      end

      it "ensures a client's phone number" do
        client = Client.new(
          first_name: 'John',
          last_name: 'Doe',
          email: 'test@example.com',
          store_id: @store.id
        ).save
        expect(client).to be(false)
      end

      it "ensures a client's email" do
        client = Client.new(
          first_name: 'John',
          last_name: 'Doe',
          phone: '0366666666',
          store_id: @store.id
        ).save
        expect(client).to be(false)
      end

      it 'ensures a client belongs to a store' do
        client = Client.new(
          first_name: 'John',
          last_name: 'Doe',
          phone: '0366666666',
          email: 'test@example.com'
        ).save
        expect(client).to be(false)
      end
    end

    context 'data joining' do
      before(:each) do
        @client = Client.new(
          first_name: 'John',
          last_name: 'Doe',
          phone: '0366666666',
          email: 'test@example.com',
          store_id: @store.id
        )
      end
      it 'should be able to view the store it belongs to' do
        expect(@client.store.name).to eq('Hello World Store')
      end
    end
  end
end
