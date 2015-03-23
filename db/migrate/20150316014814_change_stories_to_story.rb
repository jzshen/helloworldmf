class ChangeStoriesToStory < ActiveRecord::Migration
  def change
	rename_table :stories, :story
  end
end
