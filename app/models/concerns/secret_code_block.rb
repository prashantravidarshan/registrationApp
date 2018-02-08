module SecretCodeBlock
  extend ActiveSupport::Concern
  included do
  end
  def ensure_random_token
		self.code = generate_random_token unless self.code
  end
  def generate_random_token
		SecretCodesServices.new.call
  end
end
