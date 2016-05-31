class PostsMailer < ApplicationMailer

  def share(the_speech)
    @speech = the_speech

    mailt to: "to@hello.org"
 end
end
