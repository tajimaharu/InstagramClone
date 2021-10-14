class InstacloneMailer < ApplicationMailer
  def instaclone_mail(instaclone)
    @instaclone = instaclone
    mail to: "komiwork361@gmail.com", subject: "投稿の確認メール"
  end
end
