class Post < ActiveRecord::Base

  include PgSearch

  validates :title, :content, presence: true

  pg_search_scope :search_all,
                  :against => [
                    :title,
                    :author,
                    :content
                  ],
                  :using => {}
                    :tsearch => {
                    :prefix => true,
                    :negation =>true,
                    :dictionary => "english"
                    }
                  }
end
