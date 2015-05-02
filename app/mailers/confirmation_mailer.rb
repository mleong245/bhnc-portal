class ConfirmationMailer < ApplicationMailer
  def rental_approved(user)
    @user = user
    mail(to: @user.email, subject: 'You rental request has been approved!')
  end

  def rental_denied(user)
    @user = user
    mail(to: @user.email, subject: 'Your rental request has been denied')
  end

  def user_created(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to BHNC!')
  end

  def volunteer_approved(user)
    @user = user
    mail(to: @user.email, subject: 'You have been approved as a volunteer!')
  end

  def volunteer_denied(user)
    @user = user
    mail(to: @user.email, subject: 'Your volunteer application has been denied')
  end
end
