class NoticiasController < ApplicationController
 before_filter :load_dynamic
 
 def index      
    @Noticias = Notice.all(:conditions => ['published = 1'], :order => "created_at DESC")
 end
 
 def show
    @Noticia = Notice.find(params[:id])
 end
 
 def load_dynamic
   @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_NOTICIAS])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_NOTICIAS], :order => 'id DESC')
 end
end
