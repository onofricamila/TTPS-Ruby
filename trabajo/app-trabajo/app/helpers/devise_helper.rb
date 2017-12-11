# creado por mi para darle estilo a los mensajes de error de devise

module DeviseHelper
        def devise_error_messages!
         return '' if resource.errors.empty?
   
          messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
          sentence = I18n.t('errors.messages.not_saved',
          count: resource.errors.count,
          resource: resource.class.model_name.human.downcase)
   
          html = <<-HTML
          <div class="alert alert-danger"> 
           <h5><strong>Oops! #{sentence}</strong></h5>
           #{messages}
          </div>
          HTML
   
          html.html_safe
        end
end
   
   