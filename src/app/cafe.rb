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


