class FavoriteMailer < ApplicationMailer
  default from: "jonathan.h.lee@gmail.com"

  def new_comment(user, post, comment)
    # setting different headers enable conversation threading
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"

    @user = user
    @post = post
    @comment = comment

    # #19
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
