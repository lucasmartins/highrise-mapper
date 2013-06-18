class SaasCustomer
  def name
    'Rails na Praia'
  end

  def highrise_base_url
    'https://railsnapraia.highrisehq.com'
  end

  def highrise_token
    'a11386d68bdd94fe549b8498afafce56'
  end
  #must be included after required behavior has been added to the Class
  include HighriseMapper::Context
end