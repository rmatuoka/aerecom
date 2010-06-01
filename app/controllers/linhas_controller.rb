class LinhasController < ApplicationController
  def index
    redirect_to institucional_path
  end
  
  def show
    @Linha = Section.find(params[:id])
    
    @Categorias = @Linha.categories.all(:conditions => ['published = 1'])
  end
end
