class Category < ApplicationRecord
  validates :category_name, presence: true
  has_many :items
  has_ancestry

  def set_items
  # 親カテゴリーの場合
    if self.root?
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      items = Item.where(category_id: start_id..end_id)
      return items

    # 子カテゴリーの場合
    elsif self.has_children?
      start_id = self.children.first.id
      end_id = self.children.last.id
      items = Item.where(category_id: start_id..end_id)
      return items

    # 孫カテゴリーの場合
    else
      return self.items
    end
  end
end
