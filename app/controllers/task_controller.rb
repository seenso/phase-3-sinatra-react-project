class TaskController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    get "/tasks" do
      Task.all.to_json
    end
  
    get "/tasks/:id" do
      Task.find(params[:id]).to_json
    end
  
    post "/tasks" do
      Task.create(
        household_id: params[:household_id],
        user_id: params[:user_id],
        pet_id: params[:pet_id],
        task_name: params[:task_name],
        task_due_date: params[:task_due_date],
        task_is_recurring: params[:task_is_recurring],
        task_frequency: params[:task_frequency],
        task_start_date: params[:task_start_date],
        task_end_date: params[:task_end_date],
        task_location: params[:task_location]
      ).to_json

      #CREATE MULTIPLE TASKS BASED ON FREQUENCY AND START/END DATE.
      #DOESN'T WORK
      # if params[:task_frequency] == 0
      #create task
      # elsif params[:task_frequency] == 7
      #   due_date = params[:task_due_date]
      #   binding.pry
      #   x = 0
      #   arr =[]
      #   while x < 7 
      #     new_task = Task.create(
      #       household_id: params[:household_id],
      #       user_id: params[:user_id],
      #       pet_id: params[:pet_id],
      #       task_name: params[:task_name],
      #       task_due_date: due_date,
      #       task_is_recurring: params[:task_is_recurring],
      #       task_frequency: params[:task_frequency],
      #       task_start_date: params[:task_start_date],
      #       task_end_date: params[:task_end_date],
      #       task_location: params[:task_location]
      #     )
      #     x+=1
      #     arr << new_task
      #     binding.pry
      #     due_date = DateTime.parse(due_date)+7
      #   end
      #   arr.to_json
    end
  
    delete '/tasks/:id' do
      task = Task.find(params[:id])
      task.destroy
      task.to_json
    end

    patch "/tasks/:id" do
        task = Task.find(params[:id])
        task.update(
            user_id: params[:user_id],
            pet_id: params[:pet_id],
            task_name: params[:task_name],
            task_due_date: params[:task_due_date],
            task_end_date: params[:task_end_date],
            task_location: params[:task_location]
        )
        task.to_json
    end
  
  end
  