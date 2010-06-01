class InstitucionalController < ApplicationController
  def index
      @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_INSTITUCIONAL])
      
      @Conteudo = @DynamicPage.body
      @Imagem = @DynamicPage.image.url
      @Legenda = @DynamicPage.legend
      @Titulo = @DynamicPage.title
      
      @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_INSTITUCIONAL], :order => 'id DESC')
  end
      
end
