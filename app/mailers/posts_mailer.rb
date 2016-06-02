class PostsMailer < ApplicationMailer

  def share(the_post)
    @post = the_post

    mailt to: "to@hello.org"
 end
end
