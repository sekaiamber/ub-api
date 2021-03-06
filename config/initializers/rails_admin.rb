RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Login required') do |email, password|
      user = Staff.where(email: email).first
      user.authenticate(password) if user
    end
  end
  config.excluded_models = ["IdDocument"]

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
  config.model 'User' do
    edit do
      exclude_fields :parent_id, :lft, :rgt, :depth, :children_count, :api_token
    end
  end

  # config.model 'Product' do
  #   edit do
  #     field :expect_hours, :serialize
  #   end
  # end
end
