class SecretCodesServices
	def initialize(_attrs = {})
		
	end
	def call
		_generate_random_code
	end
	private
	def _generate_random_code
		return token = SecureRandom.hex(8)
	end
end