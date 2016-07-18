class SignIn
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :email, :password

  validate :check_credentials
  validates :email, :password, presence: true

  def user_id
    @user.id
  end

  private
  def check_credentials
    @user = User.find_by_email(email)

    @user.present? && @user.authenticate(password)
  end
end