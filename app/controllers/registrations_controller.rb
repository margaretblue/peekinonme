class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource == "patient"
      '/patients/new'
    else resource == "caregiver"
      '/caregiver/new'
    end
  end
end
