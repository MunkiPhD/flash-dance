module FlashDance
	class BuildPartialsGenerator < Rails::Generators::Base
		source_root File.expand_path("../templates", __FILE__)
		class_option :bootstrap, :type => :boolean, :default => true, :desc => "Include twitter bootstrap css and js for alert boxes. You should skip this if you are using Twitter's Bootstrap"
		class_option :close_buttons, :type => :boolean, :default => true, :desc => "Include close buttons for alert messages. Shouldn't skip this if you're using Twitter's Bootstrap"

		def	generate_partials
			%w(Success Error Info Warning).each do |default_type|
				template "default_partial.html.erb", "app/views/flash_dance/_#{default_type.downcase}.html.erb", {:type => default_type}

				copy_bootstrap if options.bootstrap?
			end
		end


		private
		# Copies the twitter bootstrap css and js necessary for alert boxes 
		# Components: Alerts, Close icon,
		# jQuery plugins: Transition, Alert messages
		def copy_bootstrap
			copy_file "bootstrap.css", "app/assets/stylesheets/flash_dance.alerts.bootstrap.css"
			copy_file "bootstrap.js", "app/assets/javascripts/flash_dance.alerts.bootstrap.js"
		end
	end
end
