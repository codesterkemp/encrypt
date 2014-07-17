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
      @msg = msg
    end
  end

  def xordecrypt(msg, key, startpoint = 0)
  rotor = startpoint
  b = 0
  decryptedmsg = ""
  decryptsum = 0
  while b < msg.length
    plaintext = msg[b].ord^key[rotor].ord
    decryptedmsg = decryptedmsg + plaintext.to_s + "-"
    decryptsum = decryptsum + plaintext
    if rotor != key.length - 1
      rotor = rotor + 1
    else
      rotor = 0
    end 
    b = b + 1
  end
  return decryptedmsg
end

  def decode

  end

  def crack
  end
end
