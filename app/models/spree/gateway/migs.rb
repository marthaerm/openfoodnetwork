module Spree
  class Gateway::Migs < Gateway
    preference :login, :string
    preference :password, :string

    def provider_class
      ActiveMerchant::Billing::MigsGateway
    end

    def options_with_test_preference
      options_without_test_preference.merge(test: preferred_test_mode)
    end

    alias_method_chain :options, :test_preference
  end
end
