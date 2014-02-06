class UserMailer < ActionMailer::Base
  default from: "hireme@kaylaarianamorrison.com"

  def welcome_email
    mail(
      :subject => 'Welcome to Check In On Me'
      :to => @user.email
    )
    # @user = user
    # @url  = 'http://checkinonme.herokuapp.com/account/sign_in'
    # mail(to: @user.email, subject: 'Welcome to Check In On Me')
  end

  def welcome_patient
    mail(
      :subject => 'Welcome to Your Check In On Me'
      :to => @patient.email
    )
    # @patient = patient
    # token = @patient.token
    # @url = "http:/checkinonme.herokuapp.com/patient?token=#{token}"
    # mail(to: @patient.email, subject: 'Welcome to Your Check In On Me Portal')
  end
end
