class Mailer < ActionMailer::Base
  default from: "foodtrackerhq@gmail.com"

  def share_report(report)
    @report = report
    mail(to: report.email, subject: report.subject)

  end
end
