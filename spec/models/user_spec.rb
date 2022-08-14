require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
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
    it 'ensures password is present' do
      user = User.new(email: 'test@example.com', username: 'Ray').save
      expect(user).to eq(false)
    end
    it 'should save successfully with valid data' do
      user = User.new(email: 'test@example.com', username: 'Ray', password: 'password').save
      expect(user).to eq(true)
    end
    it 'should only register one user per email used' do
      User.new(email: 'test@example.com', username: 'Ray', password: 'password').save
      user_two = User.new(email: 'test@example.com', username: 'Ray2', password: 'password').save
      expect(user_two).to eq(false)
    end
  end
end
