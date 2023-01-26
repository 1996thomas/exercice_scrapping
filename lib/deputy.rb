# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

def deputy_url
  page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  list_name = page.xpath("//a[contains(@href, '/deputes/fiche')]/@href").text
  puts 'Récupération des URL'
  puts 'Récupération des URL : OK'
  list_name.split('/deputes/fiche/OMC_')
end

def get_deputy_email(url)
  final_table = []
  url[1..].each do |i|
    page = Nokogiri::HTML(URI.open("https://www.assemblee-nationale.fr/dyn/deputes/#{i}"))
    name = page.xpath("//h1[@class ='h1 _mt-small']").text
    name = name.split(' ')
    name.shift
    email = page.xpath('//span[contains(text(),"@assemblee")]').text
    puts "Récupération de #{name[0]} #{name[1]}..."
    hash = { prénom: name[0], nom: name[1], email: email }

    final_table << hash
    # {final_table.length}"
  end
end

def perform
  puts 'Voulez vous récupérer les informations des différents députés ?'
  puts 'Veuillez écrire YES or NO'
  choice = gets.chomp.to_s
  case choice
  when 'YES'
    puts 'Execution du script ...'
    get_deputy_email(deputy_url)
  when 'yes'
    puts 'Execution du script ...'
    get_deputy_email(deputy_url)
  end
end

perform
