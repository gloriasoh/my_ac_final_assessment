# README

User Stories

Devise- DONE
I can sign up for a user account
I can sign in to my user account

Self referential associations-
User model & Subscription model
On my homepage, I should see a dashboard that will show me:
-a list of users that I am following (show all users in the db if I am not signed in)
-a list of notes of users that I am following (show all notes in the db if I am not signed in)

Authentication and one to many association-
User has many notes
Note belongs to a User
Only after I have signed in, I can create a note  DONE
Only after I have signed in, I can edit a note DONE
Only after I have signed in, I can destroy a note (doing this will automatically destroy it's associations)
Please have enough seed data in the database to demonstrate this.
Only after I have signed in, I can view a list of users I am not following in the DB, and choose to follow some users.

Only after I have signed in, I can like notes that belongs to a user.
Only after I have signed in, I can unlike notes that belongs to a user.

Action Mailer
I will receive an email notification if someone likes/unlikes my note.
You need to demonstrate this, either by showing me a real email sent to a real email address, or use mailcatcher :)

Additional requirements

You need to consume at least one API in this app. This can either be facebook, payments, or any other third party API. The usage of this API is completely up to you.

Your models should have some basic validations.

You may view this assignment as a commissioned piece of work by a client. Having tests on this app will increase the confidence of your client. Therefore, you should strive for the highest test coverage you can manage, without compromising the completeness of the app's functions.
