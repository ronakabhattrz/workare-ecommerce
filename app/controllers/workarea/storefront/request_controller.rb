module Workarea
  class Storefront::RequestController < Storefront::ApplicationController
    require 'net/http'
    require 'uri'
    require 'active_support' 
    require 'xmlsimple'

    def req
      send_year(params[:year]) if params[:year]
      send_model(params[:m],params[:year]) if params[:m] && params[:year]
      respond_to do |format|
        format.js
      end
    end

    private
    
    def send_year(year)
      parse_url("http://www.showmetheparts.info/bin/ShowMeconnect.exe?lookup=make&year=#{year}&id=PSUSA2182")
      @both = false
    end

    def send_model(m,year)
      parse_url("http://www.showmetheparts.info/bin/ShowMeconnect.exe?lookup=model&year=#{year}&make=#{m}&id=PSUSA2182")
      @both = true
    end

    def parse_url(url)
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      @data = XmlSimple.xml_in(response.body)
    end

  end
end
