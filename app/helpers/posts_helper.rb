module PostsHelper
  def render_posts(posts)
    if posts.to_a.size > 0
      render(posts)
    else
      content_tag(:div, "No posts were found", class: 'message')
    end
  end
end