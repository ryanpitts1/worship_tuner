module BlogPostsHelper
  # Create tag links
  def tag_links(tags)
  	links = tags.order("name ASC").collect{ |tag| link_to tag.name, blog_post_tag_path(tag) }
  	return links.join(", ").html_safe
  end
  
  # Sets up the blog tag cloud
  def tag_cloud(tags, classes)
  	max = 0
  	tags.each do |t|
  	  if t.count.to_i > max
  	  	max = t.count.to_i
  	  end
  	end
  	tags.each do |tag|
  	  index = tag.count.to_f / max * (classes.size - 1)
  	  yield(tag, classes[index.round])
  	end
  end
end