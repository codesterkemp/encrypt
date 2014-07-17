class EncryptController < ApplicationController
  def home
  end

  def about
  end

  def encode
    if params[:message] == "crazy"
      redirect_to "/home"
    else
      @yahoo = params[:p]
    end
  end

  def decode

  end

  def crack
  end
end
