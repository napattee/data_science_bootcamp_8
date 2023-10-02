play_rockpaperscissors <- function() {
  user_score <- 0
  bot_score <- 0
  tie_score <- 0
  actions <- c('rock', 'paper', 'scissors')
  while(TRUE){
    print("Please choose your action : rock, paper, scissors or quit")
    user_action <- readLines("stdin",1)
    bot_action <- sample(actions,1)
    if(user_action == bot_action){
      print("Not Bad The result is Tie!")
      tie_score <- tie_score + 1
    } else if (user_action == "rock" &  bot_action == "scissors" ){
      print("OK You Win!")
      user_score <- user_score + 1
    } else if (user_action == "paper" &  bot_action == "rock" ){
      print("OK You Win!")
      user_score <- user_score + 1
    } else if (user_action == "scissors" & bot_action == "paper"){
      print("OK You win")
      user_score <- user_score + 1
    } else if (user_action == "quit"){
      print("Nice Match! Goodbye")
      break
    } else {
      print("Bot Win! You noob")
      bot_score <- bot_score + 1
    }
  }
  print(paste("Your Win",':', user_score))
  print(paste("Your Lost",':', bot_score))
  print(paste("Tie",':', tie_score))
  print(paste("Total Round",':', user_score + bot_score + tie_score))
}

play_rockpaperscissors()
