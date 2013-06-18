module HighriseMapper
  module Person

    module ClassMethods 
    end
    
    module InstanceMethods
      def save_to_highrise
        unless HighriseMapper.config['person'].is_a? Hash
          raise 'Your highrise_mapper.yml does not contain the "person" configuration key.'  
        end
        self.highrise_context.setup_highrise
        highrise_person = Highrise::Person.new(build_highrise_hash)

        begin
          highrise_person.save!
        rescue Exception => e
          puts highrise_person.errors
        end
        
        return highrise_person
      end

      def build_highrise_hash
        new_hash = {}
        config = HighriseMapper.config
        config['person'].each do |k,v|
          if v!=nil && v!=''
            case k
            when 'email_address'
              new_hash['contact_data']={'email_addresses'=>[{'address'=> self.send(v),'location'=>''}]}
            else
              new_hash[k]=self.send(v)
            end
          end
        end
        return new_hash
      end
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
      check_expected_behavior(receiver)
    end

    private
    def self.check_expected_behavior(receiver)
      unless receiver.method_defined? 'highrise_context'
        raise 'Your model must respond to "highrise_context", where it returns the Instace of the HighriseMapper::Context model'
      end
    end
  end

end