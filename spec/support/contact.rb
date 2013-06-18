class Contact
  def name
    'Albert'
  end

  def last_name
    'Einstein'
  end

  def company_name
    'Princeton University'
  end

  def email
    'albert.einstein@princeton.edu'
  end

  def highrise_context
    SaasCustomer.new
  end
  #must be included after required behavior has been added to the Class
  include HighriseMapper::Person
end