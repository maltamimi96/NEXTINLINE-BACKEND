require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    context 'registration' do
      it 'ensures email is present' do
        user = User.new(username: 'Ray').save
        expect(user).to eq(false)
      end

      it 'ensures email is valid' do
        user = User.new(email: 'test@example', username: 'Ray').save
        expect(user).to eq(false)
      end

      it 'ensures username is present' do
        user = User.new(email: 'test@example').save
        expect(user).to eq(false)
      end

      it 'ensures username is unique' do
        User.create(email: 'test@example.com', username: 'Ray', password: 'password')
        user = User.new(email: 'test2@example.com', username: 'Ray', password: 'password').save
        expect(user).to eq(false)
      end

      it 'ensures password is present' do
        user = User.new(email: 'test@example.com', username: 'Ray').save
        expect(user).to eq(false)
      end

      it 'ensures password is encrypted' do
        user = User.create(email: 'test@example.com', username: 'Ray', password: 'password')
        expect(user.password_digest).not_to eq('password')
      end

      it 'should save successfully with valid data' do
        user = User.new(email: 'test@example.com', username: 'Ray', password: 'password').save
        expect(user).to eq(true)
      end

      it 'ensures users are not admin by default' do
        user = User.create(email: 'test@example.com', username: 'Ray', password: 'password')
        expect(user.admin).to eq(false)
      end

      it 'should make registered user admin is assigned so' do
        user = User.create(email: 'test@example.com', username: 'Ray', password: 'password', admin: true)
        expect(user.admin).to eq(true)
      end

      it 'should only register one user per email used' do
        User.new(email: 'test@example.com', username: 'Ray', password: 'password').save
        user_two = User.new(email: 'test@example.com', username: 'Ray2', password: 'password').save
        expect(user_two).to eq(false)
      end
    end

    context 'calling data' do
      before(:each) do
        @user = User.create(email: 'test@example.com', username: 'Ray', password: 'password')
      end

      it "should return the user's store when called" do
        store = Store.create(
          name: 'Hello World Store',
          location: 'Melbourne',
          user_id: @user.id,
          domain: 'www.example.com'
        )
        expect(@user.stores.first.name).to eq('Hello World Store')
      end
    end
  end
end
