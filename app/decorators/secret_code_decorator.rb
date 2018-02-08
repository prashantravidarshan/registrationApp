class SecretCodeDecorator < Draper::Decorator
  delegate_all
  include SecretCodesHelper
  def email_tag(_attrs = {})
  	form = _attrs[:_form]
  	form.email_field :email, class: "form-control", id: :secret_code_email, required: true 
  end
  def select_quantity(_attrs = {})
  	form = _attrs[:_form]
  	unless form.object.persisted?
        form.select :quantity, quantity_options, {}, class: "form-control", id: :secret_code_quantity, required: true
    else
        form.object.code if form.object && form.object.code
    end
  end
  def secret_code_text(_attrs = {})
  	form = _attrs[:_form]
  	form.object.persisted? ? "Secret Code" : "No of Secret codes:"
  end
end
