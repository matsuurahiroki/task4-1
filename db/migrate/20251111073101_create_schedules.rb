# db/migrate/XXXXXXXXXXXXXX_create_schedules.rb
class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string  :title,   null: false, limit: 20
      t.date    :start_on, null: false
      t.date    :end_on,   null: false
      t.boolean :all_day,  null: false, default: false
      t.text    :memo
      t.timestamps
    end

    add_index :schedules, :title

    # 終了日は開始日以降
    add_check_constraint :schedules,
      'end_on >= start_on',
      name: 'chk_schedules_end_on_on_or_after_start_on'

    # memo 500文字以内（PostgreSQLのchar_lengthで検査）
    add_check_constraint :schedules,
      'memo IS NULL OR char_length(memo) <= 500',
      name: 'chk_schedules_memo_len_le_500'
  end
end
