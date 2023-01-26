# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require_relative 'mairie__url'

def get_townhall_email(url)
  list_email = []
  list_city = []
  puts 'Récupération des URL - OK'
  url[1..].each do |i|
    page = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/#{i}"))
    email = page.xpath('//td[2][contains(text(),"@")]').text
    city = page.xpath('//h1[contains(text(),"95")]').text
    email = 'Adresse email indisponible' if email.empty?
    puts "Ajout de #{city.capitalize}"
    list_email << email && list_city << city.capitalize
  end
  puts 'Voulez-vous afficher le tableau en entier ?'
  puts 'Veuillez écrire YES or NO'
  choice = gets.chomp
  return unless choice == 'YES'

  Hash[list_city.zip(list_email)]
end

puts get_townhall_email(mairie_url)
