require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'validation tests' do
    before(:each) do
      @user = User.create(email: 'test@example.com', username: 'Ray', password: 'password')
    end

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
end
