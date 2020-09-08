require "yaml"

def load
  puts "load a word"
  wordlenght=false
  while wordlenght==false
    word=File.readlines "5desk.txt"
    word=word[rand*word.length]
    word=word.split("")
    word=word[0, word.length-2]
    if word.length>=5 && word.length<=12
      wordlenght=true
      return word
    end
  end
end


def createSecretWord(word)
  secret_word=[]
  for x in 0...word
    secret_word[x]="_"
  end
  return secret_word
end

def playGame(word, secret_word, lifes)
  condition=false
  save=""
  loop do
    puts "\n Introduce a word"
    option=gets.chomp
    for x in 0..word.length
      
      if word[x]==option
        secret_word[x]=word[x]
        condition=true
      end
    end
    print secret_word
    if condition==false
      lifes-=1
      puts "lifes remaining #{lifes}"
      print secret_word
   end
    condition=false
    puts "Do you wanna save the game? Yes/no"
    save=gets.chomp
    if save=="yes"
      saveGame(word, secret_word, lifes)
    end
    break if (lifes==0) || (word==secret_word)
  end
end

def saveGame(word, secret_word, lifes)
  file=File.open("save_file.txt", "w")
  file.puts word.join
  file.puts secret_word.join
  file.puts lifes
end

def loadGame(word, secret_word, lifes)
  file=File.open("save_file.txt")
  word=file.gets.chomp
  word=word.split("")
  secret_word=file.gets.chomp
  secret_word=secret_word.split("")
  lifes=file.gets.chomp.to_i
  playGame(word, secret_word, lifes)
end

def menu
  word=""
  secret_word=""
  choice=""
  lifes=0
  puts "Input start for new game or load for continue"
  choice=gets.chomp.downcase
  if choice=="start"
    word=load
    secret_word=createSecretWord(word.length)
    playGame(word, secret_word)
  elsif choice=="load"
    loadGame(word, secret_word,lifes)
  else
    puts "bad input"
  end
end

menu
    










