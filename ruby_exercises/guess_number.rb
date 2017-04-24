def guess_number (guess)
    number = Random.rand(100)
    if guess == number
      return "Yaay! You got it!!!"
    end
    unless guess >= number
      puts "#{guess} is too high"
    else
      puts "#{guess} is too low"
    end
end
