$cost_price = {"l" => 6, "s" => 7, "t" => 8}
$item_names = {"l"=> "Loving dog", "s"=> "Scooby Snacks", "t"=> "Tofu Special", "q"=> "Quit"}
$order_hash = {}
$password = "password"
#Some main hashes

def main() 
	quit = false
	until quit
		print_intro()
		resp = user_option()
		case resp
			when "o"
				quit = get_order()
			when "q"
				quit = confirm_quit()
			when "s"
				quit = staff_mode()
		end
	end
  system "clear"

  def print_options() #This method is where the menu will show up for their options 
	puts "-"*40
	puts " "
    puts "Special Menu:"
    puts " "
	$item_names.map do |k,v| 
		next if v == 'Quit'
		puts "Item: #{v} 	Price: $#{$cost_price[k]}"
	end
	puts "-"*40
end

def print_order(order_hash) # This method shows what the customer has ordered 
	puts " "
	puts "Your current order:"
	if $order_hash.empty?
		puts "There is nothing currently in your order."
	else
		$order_hash.map do |k,v| 
			puts "x #{v}	#{$item_names[k]} 	= $#{v * $cost_price[k]}"
		end
	end
	puts " "
	puts "	Total Bill: $#{calculate_total_bill($order_hash)}"
	puts "-"*40
    return
end

def get_order() # This methodd is for customers to add quantity and has an exit app option
    system "clear"
      print_intro()
      print_order($order_hash)
      quit = false
      until quit
          
      order = ask_order()
      return quit = true if order == "q"
      amount = ask_amount()
      puts amount
      $order_hash.key?(order) ? $order_hash[order] += amount : $order_hash[order] = amount
      system "clear"
      print_intro()
      print_order($order_hash)
      quit = follow_up()
      end
      #for the exit farewell and option to exit
      system "clear"
      print_order($order_hash)
      puts " "
      puts "Thank you for visitings Tofu's Cafe"
      puts "Type 'quit' to exit."
      print "Input: "; exit = gets.strip.downcase[0]
      exit == "q" ? (return true) : (return false)          
  end

  def calculate_total_bill(order_hash) #Method show order and show total as integer
	total = 0
	order_hash.map do
		|k,v|
		total += $cost_price[k] * v
	end
	return total
end


