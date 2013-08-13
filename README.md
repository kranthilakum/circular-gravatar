## How to use:

1. Copy the files into their respective folders
	- Copy header.scss to sass\partials
	- Copy gravatar.rb to plugins directory
2. Copy and paste the below HTML tags into header.html or use the given file
		``
		{% if site.gravatar_image %}
		  <div>
			<img class="circular-image" src="{% gravatar_image 120 %}" alt="Gravatar of {{ site.author }}" />
		  </div>
		 {% endif %}
		``
3. Update the below variables into your _config.yml file
		``
		# Gravatar
		gravatar_image: true
		gravatar_email: your.gravatar@email.ext
		``

Preview at [lakum.in](http://www.lakum.in)