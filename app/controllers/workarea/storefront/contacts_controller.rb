module Workarea
  class Storefront::ContactsController < Storefront::ApplicationController
    def show
      model = Inquiry.new(inquiry_params)
      @inquiry = Storefront::InquiryViewModel.new(model)
    end

    def create
      inquiry = Inquiry.new(inquiry_params)
      if inquiry.save
        flash[:success] = t('workarea.storefront.flash_messages.contact_message_sent')
        Storefront::InquiryMailer.created(inquiry.id.to_s).deliver_later
        redirect_to contact_path
      else
        flash[:error] =  inquiry.errors.full_messages #t('workarea.storefront.flash_messages.contact_error')
        @inquiry = Storefront::InquiryViewModel.new(inquiry)
        render :show
        puts "=======#{inquiry.errors.full_messages.inspect}=============="
      end
    end

    def index
      @inquiry = Storefront::InquiryViewModel.all
    end

    private

    def inquiry_params
      params.permit(:name, :email, :order_id, :subject, :message)
    end
  end
end
