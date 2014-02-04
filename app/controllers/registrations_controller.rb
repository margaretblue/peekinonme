class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.type == "caregiver"
      new_caregiver_path
    else
      new_patient_path
    end
  end


end
