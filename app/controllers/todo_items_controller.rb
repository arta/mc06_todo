class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  # POST /todo_lists/:todo_list_id/todo_items
  # =form_for [@todo_list, @todo_item] ..
  def create
    @todo_item = @todo_list.todo_items.create( todo_item_params )
    redirect_to @todo_list, notice: 'TODO item successfully added'
  end

  # DELETE /todo_lists/:todo_list_id/todo_items/:id
  # =link_to .. [@todo_list, @todo_item], method: :delete ..
  def destroy
    if @todo_item.destroy
      flash[:success] = 'TODO item successfully deleted.'
    else
      flash[:error] = 'TODO item cannot be deleted.'
    end
    redirect_to @todo_list
  end

  # PATCH /todo_lists/:todo_list_id/todo_items/:id/complete
  # =link_to .. [@todo_list, @todo_item], method: :patch ..
  def complete
    @todo_item.update_attribute :completed_at, Time.now
    redirect_to @todo_list, notice:'TODO item successfully completed.'
  end

  private
    def set_todo_list
      @todo_list = TodoList.find( params[:todo_list_id] )
    end

    def set_todo_item
      @todo_item = TodoItem.find( params[:id] )
    end

    def todo_item_params
      params.require( :todo_item ).permit( :content )
    end
end
