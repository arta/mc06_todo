class TodoItemsController < ApplicationController

  # POST /todo_lists/:todo_list_id/todo_items
  # =form_for [@todo_list, @todo_item] ..
  def create
    @todo_list = TodoList.find( params[:todo_list_id] )
    @todo_item = @todo_list.todo_items.create( todo_item_params )
    redirect_to @todo_list, notice: 'TODO item successfully added'
  end

  private
    def todo_item_params
      params.require( :todo_item ).permit( :content )
    end
end
