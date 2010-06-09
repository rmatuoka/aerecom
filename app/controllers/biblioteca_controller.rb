class BibliotecaController < ApplicationController
  before_filter :load_dynamic
  
  def index
    
  end
  
  def load_dynamic
   @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_BIBLIOTECA])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_BIBLIOTECA], :order => 'id DESC')
 end
end
