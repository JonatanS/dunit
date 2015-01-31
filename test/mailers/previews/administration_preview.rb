# Preview all emails at http://localhost:3000/rails/mailers/administration
class AdministrationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/administration/invite
  def invite
    Administration.invite
  end

end
