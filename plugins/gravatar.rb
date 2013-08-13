# Title: Circular Gravatar image in the header of an Octopress blog
#
# Description: Using Gravatar Ruby image requests to get an image specific to a user
# Ref: Gravatar Ruby image requests - https://en.gravatar.com/site/implement/images/ruby/
# 
# Examples:
# {% gravatar_image %}
# {% gravatar_image 80 %}

# include the MD5 gem, this should be part of a standard ruby install
require 'digest/md5'

module Jekyll

	class Gravatar < Liquid::Tag

		def initialize(tag_name, size, token)
			super
			@size = size.strip
		end

		def render(context)
			# get the site configuration variables
			site_config = context.registers[:site].config

			# get user consent to include gravatar image
			enable_gravatar = site_config['gravatar_image']
			
			# get gravatar email from the site config
			email_address = site_config['gravatar_email']
			
			# change the email address to all lowercase
			email_address = email_address.downcase

			# create an md5 hash of the email address
			hash = Digest::MD5.hexdigest(email_address)

			# compile the full Gravatar URL
			image_src = "http://www.gravatar.com/avatar/#{hash}"
			
			# append size query to URL if provided in tag
			unless @size.empty?
			  image_src = image_src+"?s=#{@size}"
			end

			# output the full Gravatar URL
			if enable_gravatar == true
				image_src
			end
		end
	end
end

# register the "gravatar_image" tag
Liquid::Template.register_tag('gravatar_image', Jekyll::Gravatar)
