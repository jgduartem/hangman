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

def playGame(word, secret_word)
  prueba=false
  vidas=8
  loop do
    puts "\n Introduce a word"
    option=gets.chomp
    p usedWords
    for x in 0..word.length
      if word[x]==option
        secret_word[x]=word[x]
        prueba=true
      end
    end
    print secret_word
    if prueba==false
      vidas-=1
      p vidas
      print secret_word
   end
    prueba=false
    break if (vidas==0) || (word==secret_word)
  end
end

word=load
p word
p word.length
secret_word=createSecretWord(word.length)
p secret_word
playGame(word, secret_word)



