require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get "/students/?" do
  @students = Student.all
  erb(:index)
end

# new
get "/students/new" do
  erb(:new)
end

# show
get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# create
post '/students' do
  @new_student = Student.new(params)
  @new_student.save
  erb(:success)
end

# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  @houses = House.all
  erb(:edit)
end
# update
post '/students/:id' do
  @updated_student = Student.new(params)
  @updated_student.update
  erb(:update)
end

# destroy
post '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete
  redirect to 'students'
end
