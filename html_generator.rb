require 'json'
require 'open-uri'

class HtmlGenerator
  def index
    html_header
    puts "<h1>All Products</h1>"

    products = raw_response
    products.each do | product |
      puts "<h2>#{product['name']}</h2>"
      puts "<img src='#{product['image_thumb_url']}'/>"
      puts "#{product['id']}"
    end
    html_footer
  end


  def show(id)
    html_header
    raw_response = open("http://lcboapi.com/products/#{id}.json").read
    parse_response = JSON.parse(raw_response)
    product = parse_response["result"]
    
    puts "<h2>#{product['name']}</h2>"
    puts "<img src='#{product['image_thumb_url']}'/>"
    puts "id: #{product['id']}"
    html_footer
  end

  def html_header
    puts "<!DOCTYPE html>"
    puts "<html>"  
    puts "  <head>"
    puts "    <title>BML Connoisseur Assignment</title>"
    puts "  </head>"
    puts "  <body>"
  end

  def html_footer
    puts "  </body>"
    puts "</html>"
  end

  def print_products
  end

  def print_product
  end

  def raw_response
    raw_response = open("http://lcboapi.com/products.json").read
    parse_response = JSON.parse(raw_response)
    products = parse_response["result"]
  end

  def raw_response_id(id)
    raw_response = open("http://lcboapi.com/products/#{id}.json").read
    parse_response = JSON.parse(raw_response_id)
    product = parse_response["result"]
  end



end

