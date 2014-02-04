class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:patient_email, :caregiver_email, :patient_name, :patient_street, :patient_city, :patient_zip, :patient_condition, :patient_phone, :caregiver_name, :caregiver_phone, :patient_phone]
    end
end
