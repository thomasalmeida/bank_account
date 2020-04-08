
# BANK ACCOUNTING
Simple bank account API.

## Setup
- Clone the project: `git clone https://github.com/thomasalmeida/bank_account.git`
- Install gems: `bundle install`
- Add database configurations (database name, database username and database password) in credentials: `EDITOR="nano" rails credentials:edit`
- Create database:  `rails db:create && rails db:migrate`
- Run the server: `rails s`

## Routes
### Account
Add a new Account
-  **Endpoint:**  `http://localhost:3000/signup`
-  **HTTP:** POST
-  **Body:**  `{ "id": "myid", username": "username", "password": "password", "password_confimation": "password", "balance": 100 }`

Login
-  **Endpoint:**  `http://localhost:3000/signin`
-  **HTTP:** POST
-  **Body:**  `{ "username": "username", "password": "password" }`

Get balance from Account
-  **Endpoint:**  `http://localhost:3000/accounts/:account_id/balance`
-  **HTTP:** GET
-  **Header**  `Authorization: Bearer $$JWT$$`

### Transaction
Transfers credit from an account to other account
-  **Endpoint:**  `http://localhost:3000/transactions`
-  **HTTP:** POST
-  **Header**  `Authorization: Bearer $$JWT$$`
-  **Body:**  `{ "source": 1, "destination": 2, "amount": 10.00 }`

## Usage
Running tests:
`rails test`

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
This project is released under the [MIT License](https://opensource.org/licenses/MIT).
