namespace :db do 
	desc "create an admin user" 
		task :create_admin_user => :environment do 
		admin = User.create( 
			:name => "Ryan Pitts",
			:email => "ryan@littleblueant.com",
			:password => "password", 
			:password_confirmation => "password", 
			:admin => true
		) 
		admin.save 
	end 
end 