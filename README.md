# Sinatra

## Helpful Hints

1. **Model: Singular vs. Plural**

    When creating tables you must be very specific about how you name things. Since a model is a model of ONE instance of that table.

    `Note` **model** is **singular** (there is one model of notes)<br> 
    `Notes` **table** is **plural** (there are multiple note objects)

2. **Association: Singular vs. Plural**

    When creating tables you must be very specific about how you name things. Since a model is a model of ONE instance of that table.
        
    A **has_many** relationship should have many of an object (`category` has_many POSTS) 
    A **belongs_to** relationship should have one object it belongs to (`post` belongs_to CATEGORY)
    
3. **Visualizing MVC-Example: Users**
    ![mvc-rails](http://goo.gl/XABwsk)
    - The browser issues a request for the */users* URL.
    - Rails routes */users* to the `index` action in the `Users` controller.
    - The index action asks the `User` model to retrieve all users (`User.all`).
    - The `User` model pulls all the users from the database.
    - The `User` model returns the list of users to the controller.
    - The controller captures the users in the `@users` variable, which is passed to the `index` view.
    - The view uses embedded Ruby to render the page as HTML.
    - The controller passes the HTML back to the browser.


## Database

`rake -T` - will get you all available rake tasks <br>
`rake generate:model NAME=list` - this generates the list table<br>
`rake generate:migration NAME=create_list` - this generates the migration that helps define the attributes of the table

## Model Migrations
```ruby
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, null: false, length: 200
      t.string :description, null: false, length: 1000
      
      t.timestamps
    end
  end
end
```

```ruby
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, length: 200
      t.string :description, null: false, length: 1000
      t.string :email, length: 100
      t.decimal :price, :precision => 10, :scale => 0
      
      t.timestamps
    end
  end
end
```

## Migrate Tables

`rake db:drop` - drop any existing tables premerge <br>
`rake db:create` - create new tables <br>
`rake db:migrate` - migrate in new table models 


## Seed Table with Data
`rake db:seed` - to seed your database <br>
`rake console` - to load up irb loaded with your app configs 

```ruby
CATEGORY_NAMES = ["Jobs", "Classifieds", "For Sale"]

CATEGORY_NAMES.each { |category_name| Category.create(name: category_name)}

post_title = ["Programmer", "Acting Job", "Bike"]
post_description = ["RoR, FullStack, Pair Progamming $60k", "Method actor required", "Used bike like new"]
post_email = ["johnny@rails.com", "johnny@acting.com", "johnny@cycling.com"]
post_price = [50000, 15.99, 299]
post_categoryid = [1,2,3]

3.times do |i|
  Post.create(
    title: post_title[i],
    description: post_description[i],
    email: post_email[i],
    price: post_price[i],
    category_id: post_categoryid[i]
    )
end
```

## RESTful Routes
RESTful routes are a concept based around the idea that certain HTTP verbs (GET, PUTS, etc) can be mimicked in MVC server side applications based on the behavior it creates while interacting with the database.

We want to make sure that the routes are related to their corresponding HTTP verbs

```ruby
GET '/posts' do #should return all POSTS
end

GET '/posts/:id' do #should return one post
end

POST '/posts/:id' do # should create a new post
end

PUT '/posts/:id' do # should edit a new post ** this is a tricky hidden command since html does not support this so check up on the documnetation
end

DELETE '/posts/:id' do # should delete a specific post
end
```
***

- a list URL that displays all the resources; for example, `/songs`
- a show URL that shows an individual resource; for example, `/songs/2`
- a new URL where you can enter the information for a new resource; for example, `/songs/new`
- a create URL that will actually create new resource; for example, `/songs`
- an edit view where you can update the information about a resource; for example, `/songs/2/edit`
- an update URL that will actually update the resource; for example, `/songs/2`
- a delete URL that will remove a resource; for example, `/songs/2`

***


<table cellpadding="10">
 <tbody><tr>
   <th>HTTP request</th>
   <th>URL</th>
   <th>Action</th>
   <th>Purpose</th>
 </tr>              
 <tr>
    <td>GET</td>
    <td>/users</td>
    <td>index</td>
    <td>page to list all users</td>
  </tr>
 <tr>
    <td>GET</td>
    <td>/users/1</td>
    <td>show</td>
    <td>page to show user with id 1</td>
  </tr>
 <tr>
    <td>GET</td>
    <td>/users/new</td>
    <td>new</td>
    <td>page to make a new user</td>
  </tr>
 <tr>
    <td>POST</td>
    <td>/users</td>
    <td>create</td>
    <td>create a new user</td>
  </tr>
 <tr>
    <td>GET</td>
    <td>/users/1/edit</td>
    <td>edit</td>
    <td>page to edit user with id 1</td>
  </tr>
 <tr>
    <td>PATCH</td>
    <td>/users/1</td>
    <td>update</td>
    <td>update user with id 1</td>
  </tr>
 <tr>
    <td>DELETE</td>
    <td>/users/1</td>
    <td>destroy</td>
    <td>delete user with id 1</td>
  </tr>
</tbody></table>



<br><br>
---
References: <br>
[How To Setup a Working Sinatra App](http://www.jonathanpeterwu.com/post/77394416493/how-to-setup-a-working-sinatra-app)<br>
[Sinatra-Up and Running](http://it-ebooks.info/read/547/)<br>
[MICROBLOG APP 3 - USERS RESOURCE](http://www.bogotobogo.com/RubyOnRails/RubyOnRails_MicroBlog_App_3_Users_Resource.php)










