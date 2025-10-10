class UserMailer < ApplicationMailer
  def send_match
    @match = params[:match]
    mail(
      to: "venomnvn@gmail.com",
      cc: ["pvnchaudhary1603@zohomail.com","dhruvsharma11008@gmail.com"],
      subject: "Worldcup Results"
    )
  end
end
