class LocacaoController < ApplicationController
  before_filter :load_dynamic
  
  def index
    @Prints = Print.all(:conditions => ['published = 1'])
  end
  
  def show
    @Print = Print.find(params[:id])
  end
   
  def load_dynamic
   @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_LOCACAO])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_LOCACAO], :order => 'id DESC')
 end
end
