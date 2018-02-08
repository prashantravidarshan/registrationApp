class SecretCodeObserver < ActiveRecord::Observer
  observe :secret_code

  def before_save(record)
  	record.ensure_random_token
  end
end
