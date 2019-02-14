class V2::ExcelsController < ApplicationController
    def index
        @products = Produck.order(:name)
        respond_to do |format|
          format.html
          format.csv { send_data @products.to_csv }
        #   format.xls #{ send_data @products.to_csv(col_sep: "\t") }
          # format.csv { render plain:  @products.to_csv }
        end
    end
end
