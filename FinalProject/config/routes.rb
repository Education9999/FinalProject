Rails.application.routes.draw do
  

  post "/students/deleteprofilepic/:id" => "students#deleteprofile", as: :delete_profile_pic

   get '/AddFriend/:message/:friend' => 'questions#addfriend', as: :AddFriend
   get '/student/student_API' => 'students#student_API'
  get "/students/student_profile/:id" => "students#student_profile" 
  
  patch '/editstudentform' => "students#editdone" , as: :editstudent
  get '/editprofile' => 'students#edit'
  delete '/deletefriend/:id' => "questions#delfriend", as: :deletefriend
 
  post '/allstudents' => 'questions#students' , as: :Allstudent
  post '/like/toggle/:id/:type' => 'likes#toggle', as: :likeToggle
  get 'answers/create'

  get 'answers/destroy'

  devise_for :students
  resources :questions, only: [:index, :create, :destroy]
  resources :answers, only: [:create, :destroy]

  root "questions#index"
  

end
