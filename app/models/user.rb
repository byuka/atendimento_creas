class User < ApplicationRecord
  include Clearance::User

  validates :permissao, inclusion: { in: PERMISSOES }

  def self.authenticate(email, password)
    return nil  unless user = find_by_email(email)
    return user if     user.authenticated?(password) && user.ativo
  end

  def admin?
    self.permissao == "Administrador"
  end
end
