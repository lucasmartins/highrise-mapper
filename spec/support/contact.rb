class Contact
  extend RSpec::Mocks
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
    @saas_customer = SaasCustomer.new
    @saas_customer.stub(highrise_base_url: 'Rails on the beach' )
    @saas_customer.stub(highrise_base_url: ENV['HIGHRISE_BASE_URL'] )
    @saas_customer.stub(highrise_token: ENV['HIGHRISE_TOKEN'] )
    return @saas_customer
  end

  def highrise_id
    112233
  end
  #must be included after required behavior has been added to the Class
  include HighriseMapper::Person
end