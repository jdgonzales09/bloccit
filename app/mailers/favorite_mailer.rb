class FavoriteMailer < ApplicationMailer
    default from: "mrfevpump@gmail.com"

    def new_comment(user, post, comment)

        headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example.com>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(user, post, favorite)
        
        headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example.com>"

        @post = post

        mail(to: user.email, subject: "You're now up to date on #{post.title}!")
    end
end
