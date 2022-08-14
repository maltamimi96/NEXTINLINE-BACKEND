require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'validation tests' do
    before(:each) do
      @user = User.create(email: 'test@example.com', username: 'Ray', password: 'password')
    end

    context 'creation' do
      it 'ensures a store is created with valid details' do
        store = Store.new(
          name: 'Hello World Store',
          location: 'Melbourne',
          user_id: @user.id,
          domain: 'www.example.com'
        ).save
        expect(store).to eq(true)
      end

      it 'ensures a name' do
        store = Store.new(
          location: 'Melbourne',
          user_id: @user.id,
          domain: 'www.example.com'
        ).save
        expect(store).to eq(false)
      end

      it 'ensures a location' do
        store = Store.new(
          name: 'Hello World Store',
          user_id: @user.id,
          domain: 'www.example.com'
        ).save
        expect(store).to eq(false)
      end

      it 'ensures a store belongs to a user' do
        store = Store.new(
          name: 'Hello World Store',
          location: 'Melbourne',
          domain: 'www.example.com'
        ).save
        expect(store).to eq(false)
      end

      it 'should be able to call a users details based on the store' do
        store = Store.create(
          name: 'Hello World Store',
          location: 'Melbourne',
          user_id: @user.id,
          domain: 'www.example.com'
        )
        expect(store.user.username).to eq('Ray')
      end
    end

    context 'data joining' do
      before(:each) do
        @store = Store.create(
          name: 'Hello World Store',
          location: 'Melbourne',
          user_id: @user.id,
          domain: 'www.example.com'
        )
        Client.create(
          first_name: 'John',
          last_name: 'Doe',
          phone: '0366666666',
          email: 'test@example.com',
          store_id: @store.id
        )
      end

      it "should be able to view it's clients" do
        expect(@store.clients.first.first_name).to eq('John')
      end

      it 'should be able to return all its clients' do
        Client.create(
          first_name: 'Chris',
          last_name: 'Smith',
          phone: '0366666666',
          email: 'test2@example.com',
          store_id: @store.id
        )
        expect(@store.clients.length).to be(2)
      end
    end
  end
end
