class AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'create a valid account' do
    post signup_url(id: 'my_id_valid', username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
    assert_response :success
    assert Account.find_by(id: 'my_id_valid')
    assert_equal JSON.parse(@response.body).keys, ['account_id', 'token']
  end

  test 'create an invalid account with id duplicated' do
    post signup_url(id: 'my_id', username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
    post signup_url(id: 'my_id', username: 'username_1', password: 'password', password_confirmation: 'password', balance: 5.0)

    assert_response :not_acceptable
    assert_equal JSON.parse(@response.body)['errors'].pop, 'Id has already been taken'
  end

  test 'create an invalid account with username duplicated' do
    post signup_url(username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
    post signup_url(username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)

    assert_response :not_acceptable
    assert_equal JSON.parse(@response.body)['errors'].pop, 'Username has already been taken'
  end

  def teardown
    Account.delete_all
  end
end