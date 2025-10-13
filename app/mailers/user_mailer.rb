# app/mailers/user_mailer.rb
require 'logger'
SENDGRID_LOG = Logger.new(Rails.root.join('log/sendgrid.log'))

class UserMailer < ApplicationMailer
  def send_match
    match = params[:match]

    html_content = ApplicationController.renderer.render(
      template: "user_mailer/send_match",
      assigns: { match: match }
    )

    data = {
          personalizations: [
        {
          to: [{ email: 'venomnvn@gmail.com' }],
          cc: [
            { email: 'pvnchaudhary1603@zohomail.com' },
            { email: 'dhruvsharma11008@gmail.com' }
          ]
        }
      ],
      from: { email: 'naveenchaudharyreddoorz@gmail.com', name: 'Naveen Chaudhary' },
      subject: 'Worldcup Results',
      content: [{ type: 'text/html', value: html_content }]
    }
    sg = SendGrid::API.new(api_key: ENV['SEND_GRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: data)

    # Log into your custom file
    SENDGRID_LOG.info "SendGrid Response: #{response.status_code} #{response.body}"
  rescue StandardError => e
    SENDGRID_LOG.error "Failed to send match email: #{e.message}"
  end
end
