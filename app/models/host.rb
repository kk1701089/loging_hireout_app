class Host < ApplicationRecord
	# モデルと紐づける設定
	has_one_attached :image
end
