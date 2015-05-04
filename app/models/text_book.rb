# == Schema Information
#
# Table name: text_books
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TextBook < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  has_many :lesson_text_books
  has_many :lessons, through: :lesson_text_books

  accepts_nested_attributes_for :pages, allow_destroy: true
  accepts_nested_attributes_for :lesson_text_books, allow_destroy: true

  def self.generate_from_slideshare(url)
    ActiveRecord::Base.transaction do
      doc = Nokogiri::HTML(open(url))
      textbook = TextBook.create!(
        name: doc.title
      )
      doc.css('.slide').each do |slide_elem|
        img_url = slide_elem.css('img').attribute('data-full').value
        next if img_url.blank?
        Page.create!(
          text_book_id: textbook.id,
          remote_image_url: img_url
        )
      end
      return textbook
    end
  end
end
