class EncryptController < ApplicationController
  def home
  end

  def about
  end

  def encode
    if params[:message]
      msg = params[:message]
      key = params[:p]
      @decoded= xordecrypt(msg, key)
    end
  end

 def xordecrypt(msg, key, startpoint = 0)
    rotor = startpoint
    b = 0
    decryptedmsg = ""
    while b < msg.length
      if b + 1 == msg.length
        next_num = b
      else
        next_num = b + 1
      end
      escaped= escape_char(msg[b],msg[b + 1])#converts escape chars to nonprintable char value
      msg[b] = escaped[0]
      esc_var = escaped[1]
      plaintext = msg[b].ord^key[rotor].ord
      puts
      puts plaintext.chr
      print plaintext
      plaintext = nonprint_fix(plaintext) #converts non printable char to printable char
      puts plaintext.ord
      print plaintext
      decryptedmsg = decryptedmsg + plaintext
      if rotor != key.length - 1
        rotor = rotor + 1
      else
        rotor = 0
      end 
      if esc_var 
        b = b + 2
      else
        b = b + 1
      end
    end
    return decryptedmsg
  end

  def escape_char(the_char, next_char)
    if the_char == '|'
      if next_char.ord > 31 and next_char.ord <= 31 + 32
        the_char = next_char.ord - 32
          return [the_char.chr,true]
      elsif next_char == '|'
        return [the_char,true]
      elsif next_char.ord == 32 + 33
        return [127.chr,true]
      else
        return [the_char,false]
      end
    else
      return [the_char,false]
    end
  end

  def nonprint_fix(char_num)
    if char_num < 32
      char_ret =  '|'+ (char_num+32).chr
    elsif char_num == 127
        char_ret = '|' + (33+32).chr
    else
      char_ret = char_num.chr
    end
    return char_ret
  end


  def decode

  end

  def crack
  end
end
