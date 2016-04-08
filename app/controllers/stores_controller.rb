class StoresController < ApplicationController

  def index
    taco_names = params[:taco] ? params[:taco][:name] : []
    salsa_names = params[:salsa] ? params[:salsa][:name] : []

    if taco_names.empty? && salsa_names.empty?
      @stores = Store.all
    else
      filtering_params = {:model => Taco, :names => taco_names}
      filtering_params[:current] = filter_stores(filtering_params)
      filtering_params[:model] = Salsa
      filtering_params[:names] = salsa_names
      @stores = filter_stores(filtering_params)
    end

    render :index
  end

  private

  def filter_stores(object)
    model = object[:model]
    names = object[:names]
    current = object[:current] || model.none

    if names.empty?
      current
    else
      if current.empty?
        current = model.find_by_name(names[0]).unique_stores
        object[:current] = current
        object[:names] = names[1..-1] || []
        filtering_process(object)
      else
        filtering_process(object)
      end
    end
  end

  def filtering_process(object)
    model = object[:model]
    names = object[:names]
    current = object[:current]

    return current if names.empty?

    names.each do |name|
      current = current & model.find_by_name(name).unique_stores
    end

    current
  end
end
