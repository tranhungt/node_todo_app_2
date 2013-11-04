mongoose = require 'mongoose'

TodoItem = new mongoose.Schema(
  title: String
)

module.exports = mongoose.model "TodoItem", TodoItem