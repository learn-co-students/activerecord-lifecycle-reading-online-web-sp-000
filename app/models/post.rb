class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  #before_save :make_title_case #To make sure that all of our Posts have the correctly-formatted title, we're going to run make_title_case during the first of the available lifecycle "points:" before_save. Our validation and lifecycle callback will make sure our posts are always title-cased.
  before_validation :make_title_case #Whenever you are modifying an attribute of the model, use before_validation. If you are doing some other action, then use before_save.

  before_save :email_author_about_post

  private

  def is_title_case # Title case means every word starts with a capital letter.#
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def email_author_about_post
    # Not implemented.
    # For more information: https://guides.rubyonrails.org/action_mailer_basics.html
  end

  def make_title_case
    self.title = self.title.titlecase #in order to make sure that our validation always passes, before every save, we want Rails to run our title-case algorithm on the title of the Post. 
  end
end
#before_create is very close to before_save with one major difference: it only gets called when a model is created for the first time. This means not every time the object is persisted, just when it is new.