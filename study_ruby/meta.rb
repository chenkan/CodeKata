require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "db.sqlite"

#ActiveRecord::Base.connection.create_table :tasks do |t|
#  t.string  :desc
#  t.boolean :completed
#end

class Task < ActiveRecord::Base; end

#task = Task.new
#task.desc = 'what'
#task.completed = true
#task.save

#Task.find_or_create_by_desc 'new_task'

#task = Task.find_by_desc 'new_task'
#puts task.desc
#puts task.completed == nil

#Task.find_by_desc! 'non-exist-task'
