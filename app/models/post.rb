class Post < ActiveRecord::Base
	validates :title, presence: true
    validates :text, presence: true,
                    length: { minimum: 5 }
end
