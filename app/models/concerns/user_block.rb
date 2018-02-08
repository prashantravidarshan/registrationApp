module UserBlock
  extend ActiveSupport::Concern
  included do
  	# Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    scope :members, -> {where(role: 'member')}
    attr_accessor :quantity
    validate :authorize_secret, :on => :create
  end
  def validate_member?
    return false if self.is_admin?
  end
  def is_admin?
    return true if self.role.try(:downcase) == "admin"
  end
  def is_member?
    return true if self.role.try(:downcase) == "member"
  end
  def authorize_secret
    _authenticate_code if self.is_member?
  end
  private
  def _authenticate_code
    _secret_code = SecretCode.where(code: self.code).first
    self.errors.add(:_, "Unauthorized code please try again later") unless _secret_code
  end

end
