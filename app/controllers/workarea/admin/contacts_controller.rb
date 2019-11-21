module Workarea
  class Admin::ContactsController < Admin::ApplicationController
    def contacts
      @inquiries = Workarea::Inquiry.all
    end

  end
end
