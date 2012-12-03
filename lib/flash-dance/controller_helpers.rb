module FlashDance
	module ControllerHelpers
		def flash_me(key, message)
			flash[key] = message
		end	
	end
end
