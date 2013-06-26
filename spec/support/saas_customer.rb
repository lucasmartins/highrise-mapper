class SaasCustomer
  # check the mock in the contact.rb for more information on how this model should behave
  def name
  end

  def highrise_base_url
  end

  def highrise_token
  end

  #must be included after required behavior has been added to the Class
  include HighriseMapper::Context
end