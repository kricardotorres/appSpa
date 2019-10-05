RailsAdmin.config do |config|

  ### Popular gems integration

 ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)
 
  ## == CancanCan ==
  # config.authorize_with :cancancan
 config.model Card do
  edit do 
    field  :title 
    field  :description , :ck_editor
    field :display_from
    field :display_finish 
  end  
 end 
 config.model Carrousel do
  edit do 
    field  :title 
    field  :description , :ck_editor
    field :display_from
    field :display_finish 
  end  
 end 
 config.model Article do
    edit do 
      field :begin_date 
      field :title
       field :status
      # For RailsAdmin >= 0.5.0
      field :content, :ck_editor
      # For RailsAdmin < 0.5.0:title
 
      # field :description do
      #   ckeditor true
      # end
    end
  end
  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
