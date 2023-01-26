# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

def mairie_url
  puts 'Récupération des URL ...'
  page = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
  list_email = page.xpath("//a[contains(@href, '/95')]/@href").text
  list_email.split('./')
end

