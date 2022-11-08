class Rental < ApplicationRecord

	# 開始日を検証
	validates :rent_start_day, presence: true #開始日がnillの場合はこっちの検証

	validate :start_check #開始日が今日より前の場合
	def start_check
    errors.add(:rent_start_day, "は今日より前の日付を登録することはできません。") if rent_start_day&. < Date.today
	end

	# 終了日を検証
	validates :rent_end_day, presence: true #終了日がnillの場合はこっちの検証

	validate :end_check #終了日が開始日より前の場合
	def end_check
    errors.add(:rent_end_day, "は開始日より前の日付を入力することは出来ません。") if rent_end_day&. < rent_start_day
	end

  # 人数を検証  
	validates :people, inclusion: {in: 1..10}
end
