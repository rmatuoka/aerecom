class CategoriasController < ApplicationController
  def show
    @Linha = Section.find(params[:linha_id])
    @Categoria = @Linha.categories.find(params[:id])
    @Produtos = @Categoria.products.all(:conditions => ['published = 1'])
  end
end
