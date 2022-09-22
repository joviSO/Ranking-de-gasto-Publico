class CongressmenController < ApplicationController
  def index
    @congressmen = Congressman.all
  end

  def import
    file = params[:file]
    state = params[:state]
    return redirect_to users_path, notice: 'Apenas CSV por favor' unless file.content_type == 'text/csv'

    CongressmanService::Importer.new.call(file)

    redirect_to congressmen_path, notice: 'Deputados importados!'
  end
end