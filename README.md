# Amenitiz Cash Register

Welcome to the **Amenitiz Cash Register**, a simple point-of-sale system built with Ruby on Rails. This application simulates a checkout process where users can view items, add them to the cart, apply discounts, and checkout.

Below are the steps necessary to get the application up and running.

---

## Table of Contents

1. [Ruby Version](#ruby-version)
2. [System Dependencies](#system-dependencies)
3. [Installation & Setup](#installation-and-setup)
4. [Running the Application](#running-the-application)
5. [Testing](#testing)
6. [Contributing](#contributing)

---

### Ruby Version

Ensure you are using the correct version of Ruby. This project uses:

```bash
ruby 3.1.2
```

### System Dependencies

You will need the following to run this application:

- **Ruby 3.1.2**
- **Rails 7.1.4**
- **Bundle** for managing gem dependencies.

### Installation and Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/FranciscoPosada/amenitiz-cash-register.git
2. **Navigate to the project directory**
    ```bash
    cd amenitiz_cash_register
3. **Change git remote URL**
    ```bash
    git remote set-url origin https://github.com/your_username/repo_name.git
    git remote -v
    ```
4. **Install required gems**
    ```bash
    bundle install
    ```
5. **Precompile assets**
    ```bash
    rails assets:precompile
    ```

### Running the Application

Once you've completed the installation and setup steps, start the Rails server:

```bash
rails s
```

Open your broswer and go to:

```bash
http://localhost:3000
```

### Testing

#### 1. Install RSpec
Install RSpec if it is not already installed.

```bash
  gem 'rspec'
```
Then run:

```bash
  bundle install
```
#### 2. Initialise RSpec
Initialise RSpec if it has not yet been initialised.

```bash
  bundle exec rspec --init
```

#### 3. Run the tests
To run all the tests, use the following command:

```bash
  bundle exec rspec
```

## Roadmap

- **User Authentication**: Implement user accounts to allow users to save their carts and purchase history and admin accounts to control stock.

- **Order History**: Allow users to view their previous purchases and receipts.

## Contributing

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement"

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/NewFeature)
3. Commit your Changes (git commit -m 'Add some NewFeature')
4. Push to the Branch (git push origin feature/NewFeature)
45. Open a Pull Request
