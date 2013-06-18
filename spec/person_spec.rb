require "spec_helper"

describe HighriseMapper::Person, "#save_to_highrise" do
  it "persists the Highrise::Person successfully" do
    HighriseMapper.config('templates')
    contact = Contact.new
    begin
      result = contact.save_to_highrise
      result.should be_a_kind_of(Highrise::Person)
      result.attributes['id'].should be_a_kind_of(Fixnum)
    ensure
      result.destroy
    end
  end
end

describe HighriseMapper::Person, "#delete_from_highrise" do
  it "deletes the Highrise::Person successfully" do
    HighriseMapper.config('templates')
    contact = Contact.new
    highrise_person = contact.save_to_highrise
    result = contact.delete_from_highrise(highrise_person.attributes['id'])
    result.should be_a_kind_of(Net::HTTPOK)
  end
end


