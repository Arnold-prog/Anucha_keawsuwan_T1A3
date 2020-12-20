GitHub Link - 

# Ruby Command Line Assignment

## Scope

The scope in a café is quite simple. When I worked in a restaurant, these were the main things that customers needed most.
 
One, was the menu, by having a menu allows the customer to see the options available and go from there. Two was having easy instructions for the customer to order. Three, give the options to add more items if they wanted to. Four, allow them to cancel the order. Five, allow seeing what they have ordered and the current total. Six confirmation if they wanted to go through with the order.
 
Then I went to think about what I should do for the staff members. When I was working the main things, I would have enjoyed options to add items, remove items and change items from the menu.

## Purpose

The purpose was in this application was to fill out all the needs stated in the scope and provide customers with an easy to follow café application allowing them to order items from the café without even needing to talk to the staff directly.
 
The issues that are trying to be resolved is, to allow the café to operate without high amounts of staff. For example, the way they use the vending machine to take orders in Japan. This was a high inspiration as when visiting there. I fell in love with the ease of ordering, you would just select what you wanted, pay for it there and hand the ticket to the staff member and your order would be brought to your table. I chose to develop something similar but in an app form.
 
The target audience is customers, who do not want to talk to people (introverted people). Customers that may not know how to order, so there are instructions for them to follow. The application is also for the cafe to use as now is a time where people prefer not to be close one another, due to 'COVID-19'. This will greatly keep the spread of germs down and aswell provide the cafe with a way to use less staff and boost gross profit. 
 
## Features

The features that I have done are:

1.  	Welcome greeting
2.      Ordering food
3.      Add multiple items/ Quantity
4.      Show final order and cost
5.      Staff mode
6.      Add Item to menu
7.      Change item on the menu
8.      Remove item to the menu
9.      Exit
10.     Thanks for coming
<br>
Code to go with the options
<br>
<br>

Greetings

 `def print_intro()
    system "clear"
	puts "Hi, welcome to Tofu's Cafe ^_^."
	puts " "
	print_options()
end
`\
This line of code allows the greetings and then prints the method or the menu options.

`def print_options()
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
`\

This code allows prints the menu for the customer so they can browse and use other options

` def ask_amount()
	puts " "
	puts "How many would you like to order?"
	print "Input: "; amount = gets.strip.to_i
	puts " " `

`if amount == 0 || Integer(amount) == nil
		puts "Sorry, that is an invalid input."
		sleep 1
		ask_amount()
	end
	return amount end 
    `\
This code gives the customer the option to add quantity and if there is nothing gives them an error. Delays for one second and allows the customer to try again. 

`def print_order(order_hash)
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
	return end 
    `\

This line of code is for the feature where it prints out the final total for the customer and then allows for customers that have not added anything to cart to do it.

`def staff_mode()
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
	return false end`

This method is for the staff menu of the app. This feature is hidden and protected by a password. The password is password.

 `def staff_remove_item()
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
	return false end
    `\ 

This feature allows the staff member to remove item. 

` def staff_change_price()
	print_staff()
	puts " "
	puts "What item would you like to change the price of?"
	$item_names.each_value do |v|
		next if v == "Quit"
		puts "[#{v[0]}]#{v[1..v.length]}"
	end
	puts " "
	print "Input: "; change = gets.strip.downcase
	puts " "
	puts "What is the new price of the item?"
	print "Input: "; change_price = gets.strip.to_i
	$cost_price[change[0]] = change_price
	return false end `\ 

 This code allows staff to change the price.




    




 <br>
 <br>

## User Interaction

These are the features that I added. When the application is running there is a welcome message, with the menu displayed. The customers can choose whether they would like to order or cancel the order. Once proceeding with the order, the customers can select what they want, then the quantity they want. After adding the quantity, there will be an option of if they want to add more items, cancel the order or they have finished with the order. Now when the selection is done the total bill is shown with the items and displays thank you for coming.
 
The staff mode used will be hidden and the staff member just needs to type stuff at the beginning. The message will be displayed and you are now in staff mode. In staff mode, the member will be able to choose whether to add, remove or change items. After this is complete the staff member can exit the staff mode and see the changes they have made.
