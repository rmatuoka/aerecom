class CategoriasController < ApplicationController
  before_filter :load_dynamic
  
  def show
    @Linha = Section.find(params[:linha_id])
    @Categoria = @Linha.categories.find(params[:id])
    #@Produtos = @Categoria.products.all(:conditions => ['published = 1'])
    
    @Produtos = @Categoria.products.paginate :page => params[:page], :conditions => ['published = 1'], :per_page => 8
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
