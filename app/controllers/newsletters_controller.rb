class NewslettersController < ApplicationController
  layout "blank"
  
  def show
    @Newsletter = Newsletter.find(params[:id])
  end
  
  def new
    @Newsletter = Newsletter.new
  end

  def create
    @Newsletter = Newsletter.create(params[:newsletter])
    
    if @Newsletter.save
      flash[:msg] = "O item foi criado com sucesso"
      redirect_to newsletter_path(@Newsletter)
    else
      flash[:msg] = "Erro ao criar o item. Verifique os erros."
      render :action => "new"
    end
  end
end
