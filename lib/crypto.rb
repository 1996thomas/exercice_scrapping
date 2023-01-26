# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
PAGE_URL = 'https://coinmarketcap.com/all/views/all/'

def crypto_scrap
  puts "Voulez vous afficher les données des cryptomonnaies ?"
  choice = gets.chomp
  if choice == "YES"
  puts "Récupération de l'URL"
  page = Nokogiri::HTML(URI.open(PAGE_URL))
  puts "Récupération de l'URL - OK"
  crypto_name = []
  crypto_value = []

  page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]/div').map do |el|
    crypto_name << el.text
  end

  page.xpath('//span[@class="sc-edc9a476-1 gqomIJ"]').map do |el|
    crypto_value << el.text
  end

  Hash[crypto_name.zip(crypto_value)]
end

puts crypto_scrap
