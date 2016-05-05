class PostMailer < ApplicationMailer
  default from: "マグスコ"

  def post_email(user)
    @user = user
    mail(to: user.email,
         subject: 'ユーザ登録ありがとうございました')
  end
end
