# Dockerized Ruby on Rails Blog Application

# App Details:

* Authenticate Users (Login, Signup).
* Each user has the following fields (name, email, password, image).
* User login using his email and password.
* All other api endpoints are not accessible without authentication.
* JWT for API authentication.
* CRUD Posts
* Each post has the following fields (title, body, author, tags, comments).
* authors can only edit/delete their own posts.
* authors can add comments on any post.
* authors can only edit/delete their own comments.
* authors can update the post tags.
* Each post must have at least one tag.
* Scheduled post deletion after 24 hours of its creation date by Sidekiq and redis.

# Installation:

* git clone https://github.com/AhmedMamduh/Blog-Application.git
* cd Blog-Application
* Type 'docker-compose up'.
* Wait till it finished.
* Type 'docker-compose exec app bundle exec rake db:create db:migrate db:seed'.
* Now you have one (user, post and comment) from seeds ready to try.

# How to use:

* Sidekiq Dashboard
	http://localhost:3000/sidekiq

* Login with existed user to get Authorization token
	POST => localhost:3000/login => { "email": "ahmed@gmail.com", "password": 123456 }

* Signup to get Authorization token
	POST => localhost:3000/signup => { "name": "ahmed2", "email": "ahmed2@gmail.com", "password": 123456, "password_confirmation": 123456 }

* Create new post
	Add 'Authorization' to headrs with the token
	POST => localhost:3000/posts => { "title": "test title", "body": "test body", "tag_list": ["tag1", "tag2", "tag3"] }

* Edit post
	Add 'Authorization' to headrs with the token
	PUT => localhost:3000/posts/:id => { "title": "edit title", "body": "edit body", "tag_list": ["tag4"] }

* Destroy post
	Add 'Authorization' to headrs with the token
	DELETE => localhost:3000/posts/:id

* Create new comment
	Add 'Authorization' to headrs with the token
	POST => localhost:3000/posts/:post_id/comments => { "body": "test comment" }

* Edit comment
	Add 'Authorization' to headrs with the token
	PUT => localhost:3000/posts/:post_id/comments/:id => { "body": "edit comment"}

* Destroy comment
	Add 'Authorization' to headrs with the token
	DELETE => localhost:3000/posts/:post_id/comments/:id

