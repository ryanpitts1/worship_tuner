module ApplicationHelper
  # Returns the full title for the current page.
  def full_title(page_title)
    base_title = "Worship Tuner"
    if page_title.empty?
      base_title
    else
      "#{page_title} > #{base_title}"
    end
  end
  
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: "#{user.name}", class: "gravatar frame-image")
  end
end
