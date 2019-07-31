# README
Step 13: Let's Deploy

To commit on Git
1.create git repository in git hub
2.git remote set-url origin https://github.com/your name/repositoryname.git
3.git add ./
4.git commit -m ""
5.git push -u origin master


To commit on Heroku
1. add to gem file 
	group :production do
 	 gem 'pg', '0.20.0'
	end
2.bundle install
3. change database.yml 
  < change adapter:postgresql>
4.git add ./
5.git commit -m ""
6.git push -u origin master
7.heroku login
4.heroku apps:create appname
5.heroku git:remote -a appname
6.git push heroku master
7.heroku run rails db:migrate


When pg error occurs
- heroku pg:info
- 1. heroku addons:create heroku-postgresql
- 2.heroku config --app your_app_name
- 3. heroku run rails db:migrate

