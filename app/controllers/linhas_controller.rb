class LinhasController < ApplicationController
  before_filter :load_dynamic
  
  def index
    redirect_to institucional_path
  end
  
  def show
    @Linha = Section.find(params[:id])
    
    @Categorias = @Linha.categories.all(:conditions => ['published = 1'])
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
