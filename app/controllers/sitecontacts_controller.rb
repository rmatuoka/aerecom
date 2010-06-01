class SitecontactsController < ApplicationController
  before_filter :load_dynamic
  
  def index
    redirect_to new_sitecontact_path
  end
  
  def show
    @Contato = Sitecontact.find(params[:id])
  end
  
  def new
    @Contato = Sitecontact.new
  end

  def create
    @Contato = Sitecontact.create(params[:sitecontact])
    
    if @Contato.save
      #ENVIA EMAIL
       @corpo = "Nome:  + #{params[:name]}
       <br>Email: + #{params[:email]}
       <br>Mensagem: + #{params[:message]}"
      
      redirect_to sitecontact_path(@Contato)
      
      #if Notifier.deliver_enviar(@corpo.to_s,"Contato Via SITE", params[:email])
        
       # flash[:msg] = "enviado"
      #else
        #flash[:msg] = "E-mail não enviado"
      #end
    else
      render :action => "new"
    end
  end
  
  def load_dynamic
    @DynamicPage = DynamicPage.first(:conditions => ['id = ? AND published = 1', ID_CONTATO])
    
    @Conteudo = @DynamicPage.body
    @Imagem = @DynamicPage.image.url
    @Legenda = @DynamicPage.legend
    @Titulo = @DynamicPage.title
    
    @Header = Header.first(:conditions => ['dynamic_page_id = ? AND published = 1', ID_CONTATO], :order => 'id DESC')
  end
end
