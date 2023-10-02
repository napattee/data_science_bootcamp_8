pizza_menu <- c("cheese", "hawaiian", "seafood", "chicken bbq")
pizza_price <- c(219, 219 , 239, 219)
pizza_df <- data.frame(pizza_menu,pizza_price)


chatbot <- function(){
  print("Hello")
  user_name <- readline("What's your name?: ")
  print(paste("Welcome to our pizza restaurant", user_name))
  print("Our pizza menu : cheese, hawaiian, seafood, chicken bbq")
  user_menu <- tolower(readline("What would you like to order?: "))
    print(paste("Your order is", user_menu))
    print("Our pizza sizes are M, L ")
    print("If you choose L size, we charge 30")
    pizza_size <- toupper(readline("Choose your pizza size : "))
    if (pizza_size == "M"){
      print(paste("You choose",pizza_size,"size"))
    } else {
      print(paste("You choose",pizza_size,"size so we charge 30"))
    }
    print(paste("So your order is",user_menu,"and pizza size is",pizza_size))
    if (pizza_size == "M"){
      print(paste("Total price is",pizza_df$pizza_price[pizza_menu==user_menu],"Baht"))
    } else {
      print(paste("Total price is",pizza_df$pizza_price[pizza_menu==user_menu] + 30, "Baht"))
    }
    print("Thank you and Enjoy your pizza")
}

chatbot()
