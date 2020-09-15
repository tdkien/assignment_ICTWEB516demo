class ListTask < ApplicationRecord
	has_many :tasks, dependent: :destroy
end
