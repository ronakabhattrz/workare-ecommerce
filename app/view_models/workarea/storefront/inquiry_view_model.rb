module Workarea
  module Storefront
    class InquiryViewModel < ApplicationViewModel
      include DisplayContent
      include Mongoid::Document
      
      def title
        browser_title.presence ||
          ::I18n.t('workarea.storefront.contacts.contact_us')
      end

      def subjects
        Workarea.config.inquiry_subjects.map { |k, v| [v, k] }
      end

      private

      def content_lookup
        'contact_us'
      end
    end
  end
  decorate Inquiry do
    decorated do
      validates :name, presence: true
      validates :email, presence: true
      validates :message, presence: true
      
      validates :name,
      length: { 
        maximum: 30,
        too_long: "must have no more than %{count} characters."
      }

      validates :email,
      length: { 
        maximum: 30,
        too_long: "must have no more than %{count} characters.",
        with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
      }

      validates :message,
      length: { 
        minimum: 300,
        too_short: " must have at least %{count} characters."
      }
    end
  end
end
