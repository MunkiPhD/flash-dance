module FlashDance
	module ViewHelpers
		# Renders the specified partials for all the messages in the flash hash
		# compact: 
		#		true - display hash contents with more than one message in a compact unordered list
		#		false - display hash contents with more than one message as their own individual alert
		def render_flash_messages(compact = true)
			rendered_partials = []

			flash.each do |key, messages|
				# check to see if this hash key has any flash data in an array. This is to handle the case where the flash has been set directly and not through flash-dance
				unless messages.kind_of?(Array)
					rendered_partials << render_partial(key, messages)
					next
				end

				# if you want it to be compact and there is more than one message in the array, create an unordered list
				if compact && messages.length > 1 
					message_elements = []

					messages.each do |message|
						message_elements << content_tag(:li, message) # using the content_tag helper ensures that the message will be html safe
					end

					# we can set temp_message as html_safe because the content_tag helper will handle non-secure text
					message_to_send = content_tag(:ul, message_elements.join.html_safe)
					rendered_partials << render_partial(key, message_to_send.html_safe)
				else
					messages.each do |message|
						rendered_partials << render_partial(key, message)
					end
				end
			end

			return raw(rendered_partials.join)
		end


		private

		# partial_message: the specified name of the partial in the flash_dance directory
		# message: the message to display in the partial
		def render_partial(partial_name, message)
			render(:partial => "flash_dance/#{partial_name}", :locals => {:message => message})
		end
	end
end
