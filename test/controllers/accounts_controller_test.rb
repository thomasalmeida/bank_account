class AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'create a valid account' do
    post signup_url(id: 'my_id_valid', username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
    assert_response :success
    assert Account.find_by(id: 'my_id_valid')
    assert_equal JSON.parse(@response.body).keys, ['account_id', 'token']
  end

  test 'not create an invalid account with id duplicated' do
    post signup_url(id: 'my_id', username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
    post signup_url(id: 'my_id', username: 'username_1', password: 'password', password_confirmation: 'password', balance: 5.0)

    assert_response :not_acceptable
    assert_equal JSON.parse(@response.body)['errors'].pop, 'Id has already been taken'
  end

  test 'not create an invalid account with username duplicated' do
    post signup_url(username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
    post signup_url(username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)

    assert_response :not_acceptable
    assert_equal JSON.parse(@response.body)['errors'].pop, 'Username has already been taken'
  end

  test 'get account balance' do
    post signup_url(id: 'my_id_2', username: 'username_2', password: 'password_2', password_confirmation: 'password_2', balance: 30.0)
    assert_response :success
    post signin_url(username: 'username_2', password: 'password_2')
    assert_response :success
    token = JSON.parse(@response.body)['token']

    get balance_url(account_id: 'my_id_2'), headers: { authorization: "Bearer #{token}" }
    assert_response :success
  end

  test 'not get balance from inexistent account' do
    get balance_url(account_id: 'my_id')

    assert_response :unauthorized
  end

  def teardown
    Account.delete_all
  end
end