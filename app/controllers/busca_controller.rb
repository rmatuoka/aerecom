class BuscaController < ApplicationController
  before_filter :load_dynamic
  
  def index
    if !params[:s].blank?
      @Termo = params[:s]
      #BUSCA NOTICIAS
      @Noticias = Notice.find(:all) do
        any do
          title.contains? params[:s]
          body.contains? params[:s]
          summary.contains? params[:s]
        end
      end
    
      #BUSCA PRODUTOS
      @Produtos = Product.find(:all) do
        any do
          title.contains? params[:s]
          description.contains? params[:s]
        end
      end
    end
  end
  
  def load_dynamic
   @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_BUSCA])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_BUSCA], :order => 'id DESC')
 end
end
