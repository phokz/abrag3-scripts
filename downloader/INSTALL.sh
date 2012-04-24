#tested on ubuntu 10.04 LTS

sudo apt-get -y install ruby irb rdoc ri ruby1.8-dev libopenssl-ruby
sudo apt-get -y install libxml2-dev libxslt-dev

gemversion=1.8.222
wget http://production.cf.rubygems.org/rubygems/rubygems-$gemversion.tgz
tar xfvz rubygems-$gemversion.tgz; cd rubygems-$gemversion
sudo ruby setup.rb
sudo ln -s /usr/bin/gem1.8 /usr/bin/gem

sudo gem install mechanize

