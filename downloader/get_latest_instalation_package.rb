#!/usr/bin/ruby

require 'rubygems'
require 'logger'
require 'mechanize'
require 'yaml'

agent = Mechanize.new{|a| a.log = Logger.new("logfile") }
#agent.set_proxy('a-proxy', '8080')

config=YAML::load(File.open('credentials.yml').read)["abra.eu"]

page = agent.get 'http://www.abra.eu/'

form = page.forms.first
form.Username = config["login"]
form.Password = config["password"]

page = agent.submit form


m = page.body.match(/download-g3\.php\"><b>([0-9\.]+)<\/b>/)
abra_verze=m[1]
puts "Aktualni verze #{abra_verze}"

filename="AbraG3-#{abra_verze}-CZ.exe"
url="http://www.abra.eu/download/abra_g3/#{filename}"

agent.pluggable_parser.default = Mechanize::Download
agent.get(url).save(filename)

