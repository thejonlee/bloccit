module UsersHelper

  def user_posts(user)
    if @user.posts.empty?
      return "#{user.name} has not submitted any posts yet."
    else
      render @user.posts
    end
  end

  def user_comments(user)
    if @user.comments.empty?
      return "#{user.name} has not made any comments yet."
    else
      render @user.comments
    end
  end

  def favorited_posts(user)
    if @user.favorites.empty?
      return "#{user.name} has not favorited any posts yet."
    else
      render @user.favorites.map(&:post)
    end
  end
end
