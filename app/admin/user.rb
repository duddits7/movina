ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, roles: []

  index do
    selectable_column
    id_column
    column :email
    column :roles do |r|
      r.roles.map { |role| role.name }.join(', ')
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
#      f.input :roles, as: :check_boxes
      f.input :roles, as: :select, multiple: true, collection: Role.all
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # Allow form to be submitted without a password
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete 'password'
        params[:user].delete 'password_confirmation'
      end
      add_roles(resource)
      update!
      #super
    end

    private
    def add_roles(resource)
      resource.roles = []
      params[:user][:role_ids].each { |r| resource.roles.push(Role.find(r)) unless r.blank? }
    end

  end

end
