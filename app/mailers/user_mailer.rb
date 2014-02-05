class UserMailer < ActionMailer::Base
  default from: "margaretblue@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://checkinonme.herokuapp.com/account/sign_in'
    mail(to: @user.email, subject: 'Welcome to Check In On Me')
  end

  def welcome_patient(patient)
    @patient = patient
    token = @patient.token
    @url = "http:/checkinonme.herokuapp.com/patient?token=#{token}"
    mail(to: @patient.email, subject: 'Welcome to Your Check In On Me Portal')
  end
end
