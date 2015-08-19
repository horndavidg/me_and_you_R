class ApplicationMailer < ActionMailer::Base
  default from: "help@meandyou.com"
  default_url_options[:host] = "localhost:3000"
end
