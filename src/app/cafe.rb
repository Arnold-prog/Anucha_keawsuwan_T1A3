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

