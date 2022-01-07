class HouseholdController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    get "/households" do
      Household.all.to_json(include: :users)
    end

  # Gets all the task data associated with a household via tasks (who the task is assigned to and which pet the task is for)
    get "/households/:id/all" do
      Household.find(params[:id]).to_json(include: {
        tasks: {
          include: [
            :pet,
            :user
            ]
          }
        }
      )
    end
  
    get "/households/:id" do
      Household.find(params[:id]).to_json(include: :users)
    end

    # Gets all the pet data associated with a household
    get "/households/:id/pets" do
      Household.find(params[:id]).pets.to_json
    end

    #Gets all users based off of household id
    get "/households/:id/users" do
      Household.find(params[:id]).users.to_json
    end

  # Gets all the task data associated with a household via tasks (who the task is assigned to and which pet the task is for)
  get "/households/:id/tasks" do
      Task.where(household_id:params[:id]).order(:task_due_date).to_json(include: [:user, :pet, :household])
  end

  post "/households/:id/tasks" do
    Household.find(params[:id]).to_json(include: {
      tasks: {
        include: [
          :pet,
          :user
          ]
        }
      }
    )
  end
  
    post "/households" do
      Household.create(
        household_name: params[:household_name]
      ).to_json
    end
  
    delete '/households/:id' do
      house = Household.find(params[:id])
      house.destroy
      house.to_json
    end

    patch "/households/:id" do
        house = Household.find(params[:id])
        house.update(
            household_name: params[:household_name]
        )
        house.to_json
    end
end