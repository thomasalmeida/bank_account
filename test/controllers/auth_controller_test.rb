class AccountsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post signup_url(id: 'my_id', username: 'username', password: 'password', password_confirmation: 'password', balance: 5.0)
  end

  test 'sign in with a valid account' do
    post signin_url(username: 'username', password: 'password')
    assert_response :success
    assert_equal JSON.parse(@response.body).keys, ['account', 'token']
    assert_equal JSON.parse(@response.body)['account'].keys, ['id', 'username', 'password_digest', 'balance', 'created_at', 'updated_at']
    JSON.parse(@response.body)['account']['id'] = 'my_id'
    JSON.parse(@response.body)['account']['balance'] = 5.0
  end

  test 'not sign in with an invalid account' do
    post signin_url(username: 'username', password: 'password1')

    assert_response :unprocessable_entity
    assert_equal JSON.parse(@response.body)['failure'], 'Log in failed!'
  end


  def teardown
    Account.delete_all
  end
end