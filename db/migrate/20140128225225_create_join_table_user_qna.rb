class CreateJoinTableUserQna < ActiveRecord::Migration
  def change
    create_join_table :users, :qnas do |t|
      # t.index [:user_id, :qna_id]
      # t.index [:qna_id, :user_id]
    end
  end
end
