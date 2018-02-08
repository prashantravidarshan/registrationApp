module SecretCodesHelper
	def quantity_options
		[1,10,20,50,100].collect{|q| [q,q]}
	end
	def secret_code_text
		should_have_quantity? ? "No of Secret codes:" : "Secret Code"
	end
end
