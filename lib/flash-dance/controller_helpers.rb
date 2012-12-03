module FlashDance
	module ControllerHelpers
		def flash_me(key, message)
			flash[key] ||= []
			flash[key] << message unless message.blank?
		end	

		def flash_me_now(key, message)
			flash.now[key] ||= []
			flash.now[key] << message unless message.blank?
		end
	end
end
