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

def ask_amount()#Method to ask for quantity of order.
	puts " "
	puts "How many would you like to order?"
	print "Input: "; amount = gets.strip.to_i
	puts " "
	if amount == 0 || Integer(amount) == nil
		puts "Sorry, that is an invalid input."
		sleep 1
		ask_amount()
	end	
	return amount
end

def ask_order() # ask for order, gives exit option.
	puts " "
	puts "What would you like to order? Or type 'quit' to exit."
	str = ""
	$item_names.each_value{|v| str+= "[#{v[0]}]#{v[1..v.length]}, " if v != "Quit"}
	puts str.delete_suffix(', ')
	print "Input: "; order = gets.strip.downcase[0]

	unless order == "l" || order == "t" || order == "s" || $item_names.key?(order) #if error gives them a way to go again
		puts "Sorry that is not a valid order. Please try again."
		sleep 2
		system "clear"
		print_intro()
		print_order($order_hash)
		ask_order()
	end	
	return order
end

def follow_up() #Method follow up if the input is not correct shows again.
    puts "To continue ordering type 'continue'"
    puts "To finish ordering tpye 'finished'"
	print "Input: "; resp = gets.strip.downcase[0]
	if resp == 'c'
		print_intro()
		print_order($order_hash)
		return
	elsif resp == 'f'
		return true
	else
		puts "Sorry that is not a valid response."
		follow_up()
	end
end

def print_intro()# Welcome method.
    system "clear"
	puts "Hi, welcome to Tofu's Cafe ^_^."
	puts " "
	print_options()
end

def confirm_quit() #Method to confirm quit
	system "clear"
	puts "Are you sure you want to exit?"
	puts "y/n"
	print "Input: "; ans = gets.strip.downcase[0]
	ans == 'y' ? (return true) : (return false)	
end

def staff_mode() #Metho for staff mode allows add, remove and change menu.
	system "clear"
	puts "You're in staff mode now!"
	puts "To continue, please enter password."
	print "Input: "; pass = gets.strip
	
	if pass == $password
		exit = false
		until exit	
		print_staff()
		option = staff_options()
			case option
				when "a"
					exit = staff_add_item()
				when "r"	
					exit = staff_remove_item()
				when "c"
					exit = staff_change_price()
				when "e"
					exit = true
			end
		end 
	else 
		puts "Access Denied!"
		sleep 3
		return true
	end 
	return false
end

def staff_options()#Method for staff options.
	puts " "
    puts "Do you want to.. Type the first word to begin"
	puts "Add an item?"
	puts "Remove an item?"
	puts "Change prices?"
	puts "Exit?"
	puts " "
	print "Input: "; option = gets.strip.downcase[0]
	return option
end

def staff_add_item()#Metho for staff to add items.
	print_staff()
	puts " "
	puts "What is the new item you would like to add?"
	print "Input: "; new_item = gets.strip.downcase
	puts " "
	puts "What is the price of this item?"
	print "Input: "; new_price = gets.strip.to_i
	$cost_price[new_item[0]] = new_price
	$item_names[new_item[0]] = new_item.capitalize
	return false
end

def staff_remove_item()#Method for staff to remove items.
	print_staff()
	puts " "
	puts "What item would you like to remove?"
	$item_names.each_value do |v|
		next if v == "Quit"
		puts "[#{v[0]}]#{v[1..v.length]}"
	end
	puts " "
	print "Input: "; rem = gets.strip.downcase
	$item_names.delete(rem[0])
	$cost_price.delete(rem[0])
	return false
end
