class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  before_validation :make_title_case

  # New Code!!
  # before_save :email_author_about_post

  before_create :post_status

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def email_author_before_post
    # Not implemented
    # For more information: https://guides.rubyonrails.org/action_mailer_basics.html
  end

  def post_status?
    if self.post_status? == false
      errors.add(:post_status, "post_staus must be true")
    end
  end



end
