class Notifier < ActionMailer::Base
  def enviar(corpo, assunto, email = "rmatuoka@agenciaeconomica.com.br",responder = "rmatuoka@agenciaeconomica.com.br")
        recipients email
        from "rmatuoka@agenciaeconomica.com.br"
        subject assunto
        reply_to responder
        body :corpo => corpo
    end
end
