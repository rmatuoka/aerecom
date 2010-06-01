class ProdutosController < ApplicationController
  def show
    @Linha = Section.find(params[:linha_id])
    @Categoria = @Linha.categories.find(params[:categoria_id])
    @Produto = @Categoria.products.find(params[:id])
  end
end
