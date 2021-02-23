#Bhatara Chaemchan
#6210545998
require 'net/http'
require 'open-uri'
require 'nokogiri'
module StockGem
  class Stock
    def self.print_stock
      prefix = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      prefix_list = prefix.split("")
      prefix_list.each do |prefix|
        pre_url = 'https://www.set.or.th/set/commonslookup.do?language=th&country=TH&prefix='+prefix
        document = open(pre_url)
        content = document.read
        parsed_content = Nokogiri::HTML(content)

        a = parsed_content.css('table.table-profile.table-hover.table-set-border-yellow').css('a')
        a.each do |link|
          sub_link = link['href']
          link = 'https://www.set.or.th/' + sub_link
          document = open(link)
          content = document.read
          parsed_content = Nokogiri::HTML(content)
          com_name = parsed_content.xpath('//*[@id="maincontent"]/div/div[1]/div[1]/h3').text

          sub_link.gsub!('companyprofile', 'companyhighlight')
          link = 'https://www.set.or.th/' + sub_link
          document = open(link)
          content = document.read
          parsed_content = Nokogiri::HTML(content)
          money = parsed_content.xpath('//*[@id="maincontent"]/div/div[4]/table/tbody[1]/tr[2]/td[5]').text

          puts result = com_name + ' : ' + money
        end
      end
    end
  end
  end
