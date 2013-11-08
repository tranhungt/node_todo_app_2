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
    console.log req.body
    todo_item.title = req.body.todo_title
    todo_item.save (err, todo_item) ->
      if not err
        res.statusCode = 201
        res.json todo_item
      else
        res.render 'index'

  delete: (req, res) ->
    item_id = req.params.id
    todo_item = TodoItem.findByIdAndRemove item_id, (err) ->
      if not err
        res.send({item_id: item_id})
      else
        res.render 'index'

  update: (req, res) ->
    todo_item = TodoItem.findById req.params.id, (err, todo_item) ->
      todo_item.title = req.body.todo_title
      todo_item.save (err, todo_item) ->
        if not err
          res.statusCode = 201
          res.send(todo_item.title)
        else
          res.render 'index'

  random: (req, res) ->
    res.render 'todo_items/random'