class ImpressaoController < ApplicationController
  before_filter :load_dynamic
  
  def index
    
  end
  
  def load_dynamic
   @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_IMPRESSAO])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_IMPRESSAO], :order => 'id DESC')
 end
end
