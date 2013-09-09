ActiveAdmin.register User do
  form do |f|
    f.inputs "Nuevo usuario" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.buttons
    end
  end
end
