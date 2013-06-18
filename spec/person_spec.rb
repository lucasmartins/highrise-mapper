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
