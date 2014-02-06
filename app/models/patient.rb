class Patient < ActiveRecord::Base
  belongs_to :user
  has_many :checkins

  before_create :generate_token

  def to_param
    token
  end

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
