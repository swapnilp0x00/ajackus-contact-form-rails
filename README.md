# Contact us form service

This is a simple "contact me" service.

* Created Rails application without test suit, without active_storage and action_cable.

* Added "contact" model with first name, last name, email, phone and message.

* Added routes to GET contact to render form and POST contact to store contact into database.

* Added Rspec and Written test cases for contact model.

* Added simplecov for finding test case coverage.

* Added Mailer and integration of Mailgun.

* When entry is created in database, email is send to ```info@ajackus.com```.

* check your mail ```infor@ajackus.com``` and find a confirmation mail send by mailgun to confirm recieving mails by clicking on ```I Agree``` button. You will not recieve emails until you accept the confirmation.

* Added language support for two languages English and German

# Requirements

* Ruby 2.6.*

* Rails 6+



# How run test cases

```rspec spec/```

# Steps to run project

* 1. Clone repo into your local machine using.
```git clone <Repo URL>```

* 2. Run ```bundle install```

* 3. Setup database using  ```rake db:setup```

* 4. Run migrations using ```rake db:migrate```

* 5. Run server using ``rails s``

* 6. Visit ```localhost:3000```
