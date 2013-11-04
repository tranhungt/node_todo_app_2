TodoItem = require '../models/todo_item'

module.exports = 
  index: (req, res) ->
    TodoItem.find {}, (err, todo_items) ->
      # res.send todo_items
      res.render 'todo_items/index', {
        todo_items: todo_items
      }

  create: (req, res) ->
    todo_item = new TodoItem 
    todo_item.title = req.body.todo_title
    todo_item.save (err, todo_item) ->
      if not err
        res.statusCode = 201
        res.redirect("back")
      else
        res.render 'index'
