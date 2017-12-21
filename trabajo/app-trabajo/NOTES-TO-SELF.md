#  :loudspeaker: Keep in mind

* To export the current db info into the seeds.rb file open the console and knowing you are in the _app-trabajo_ folder run `rake export:seeds_format > db/seeds.rb `(alert! '>' is destructive. Use '>>' to append)

* seeds.rb ...
    * Write `User.create! :email => 'root@gmail.com', :password => 'topsecret',  password_confirmation => 'topsecret'` if you exported the current db info so as to have a root user.
    * Dates need to be in this sample format `'2017-12-25'`.


# ASK

