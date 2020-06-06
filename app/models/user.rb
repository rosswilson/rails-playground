class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  before_create :confirmation_token

  has_secure_password

  has_rich_text :content

  def email_activate
    self.email_confirmed_at = DateTime.now
    self.email_confirm_token = nil

    save!
  end

  private

    def confirmation_token
      if self.email_confirm_token.blank?
          self.email_confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
