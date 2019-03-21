class StaticPagesController < ApplicationController

  def method_missing(method, *args)
    if lookup_context.exists?("#{method}.html", ['static_pages'], false)
      respond_to do |format|
        format.html { render "#{method}.html" }
      end
    else
      super
    end
  end
end
