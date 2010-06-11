class ProdutosController < ApplicationController
  before_filter :load_dynamic
  
  def show
    @Linha = Section.find(params[:linha_id])
    @Categoria = @Linha.categories.find(params[:categoria_id])
    @Produto = @Categoria.products.find(params[:id])
    
    #@posts = Post.paginate :all, :page => params[:page], :per_page => 10
  end
  
  def load_dynamic
   @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_PRODUTO])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_PRODUTO], :order => 'id DESC')
 end
end
