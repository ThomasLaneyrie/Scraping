require 'nokogiri' 
require 'open-uri'

def open_nokogiri(url)                   # Entrée : une URL / Sortie : un doc Nokogiri
  Nokogiri::HTML(URI.open(url))   
end

def deputes_email(url_depute)            # Entrée : une URL / Sortie : un e-mail de député
  page_depute = open_nokogiri(url_depute)
  email = (page_depute.xpath('//*[text()[contains(., "@")]]').text)[1..]  
end

def internet_webpage_deputes(url_assemblee_nationale)      # Entrée : l'URL avec tous les députés de France / Sortie : liste d'adresse url de chaque député
  page_deputes = open_nokogiri(url_assemblee_nationale)
  hash_par_deputes = Hash.new
  array_all_deputes = Array.new

  # Cherche dans la page tous les députés et remet au propre dans un array un hash/député avec 3 infos : les prenoms, noms, et e-mail associés.
  page_deputes.xpath('//*[@id="deputes-list"]//div/ul/li/a').each do |s|     
    hash_par_deputes = {}
    prenom = s.text.split.select.with_index{|value, index| index == 1}.join("")
    nom = s.text.split.select.with_index{|value, index| index == 2 || index == 3}.join(" ")

    # Retravailler l'URL pour utiliser ma fonction deputes_mail et trouver l'email par député
    url_not_entire = s["href"]
    url = "https://www.assemblee-nationale.fr/dyn/deputes/" + url_not_entire[url_not_entire.index("PA"), url_not_entire.length]
    email = deputes_email(url)               
   
    #Remplissage du hash par députés 
    hash_par_deputes["first_name"] = prenom         
    hash_par_deputes["last_name"] = nom
    hash_par_deputes["email"] = email
    puts hash_par_deputes
    array_all_deputes.push(hash_par_deputes)
  end
  return array_all_deputes   # Renvoi un array avec 1 hash/député contenant : prenom, nom, email.
end

def perform
  url_assemblee_nationale = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
  puts internet_webpage_deputes(url_assemblee_nationale)
end

perform