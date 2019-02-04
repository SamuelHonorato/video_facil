module Api
	module V1
		class CategoriesController < ApplicationController

			def show
				id = params[:id]
        categories = Category.where(id: id)

        if categories.length > 0
          category = categories.first
          videos = category.videos

  				render json: {
  						status: 'SUCCESS',
  						message:'Videos da categoria carregados',
              category: {
                id: category.id,
                name: category.name
              },
              videos: {
                length: videos.length,
                data: videos.select(:id, :title, :url)
              }
  					},
  					status: :ok
        else
          render json: {
            status: "ERRORS",
            code: 500,
            message: "Categoria não encontrada"
          }
        end

			end

		end
	end
end
