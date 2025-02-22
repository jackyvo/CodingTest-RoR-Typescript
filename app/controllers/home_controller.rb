# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_todo_item, only: [:edit_todo_item]

  def landing
    @todos = Todo.all.order(:id)
  end

  def edit_todo_item
    @todo_item.update(todo_item_params)
    render json: Todo.all.order(:id).to_json
  end

  def reset_todo_items
    Todo.update_all(checked: false)
    render json: Todo.all.order(:id).to_json
  end

  private

  def todo_item_params
    params.permit(:id, :title, :checked)
  end

  def set_todo_item
    @todo_item = Todo.find(todo_item_params[:id])
  end
end
