require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'valid account with id' do
    account = Account.new(id: 'john', username: 'john', password: 'john', balance: 1.1)
    assert account.valid?
  end

  test 'valid account without id' do
    account = Account.new(username: 'john', password: 'john', balance: 1.0)
    assert account.valid?
  end

  test 'valid account with id and balance' do
    account = Account.new(username: 'john', password: 'john')
    assert account.valid?
  end

  test 'valid account without balance' do
    account = Account.new(id: 'john', username: 'john', password: 'john')
    assert account.valid?
  end

  test 'invalid without username' do
    account = Account.new(password: 'john')
    refute account.valid?
    assert_not_nil account.errors[:username]
  end

  test 'invalid without password' do
    account = Account.new(username: 'john')
    refute account.valid?
    assert_not_nil account.errors[:password]
  end
end
