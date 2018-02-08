module SecretCodesHelper
	def quantity_options
		[1,10,20,50,100].collect{|q| [q,q]}
	end
	def should_have_quantity?
		return (params[:controller] == "secret_codes" && (params[:action] =="new" || params[:action] == "create")) ? true : false
	end
	def secret_code_text
		should_have_quantity? ? "No of Secret codes:" : "Secret Code"
	end
end
