class Product < ApplicationRecord
    def self.filter_search(name_search,type_select,brand_select)
        if name_search
            if name_search !="" && type_select == "" && brand_select == ""
                where("name LIKE?","%#{name_search}%")
            elsif name_search == "" && type_select != "" && brand_select == ""
                where('type_id = ?', type_select)
            elsif name_search == "" && type_select == "" && brand_select != ""
                where('brand_id = ?', brand_select)
            elsif name_search != "" && type_select != "" && brand_select == ""
                where("name LIKE? AND type_id = ?","%#{name_search}%", type_select)
            elsif name_search != "" && type_select == "" && brand_select != ""
                where("name LIKE? AND brand_id = ?","%#{name_search}%", brand_select)
            elsif name_search == "" && type_select != "" && brand_select != ""
                where("type_id LIKE? AND brand_id = ?",type_select, brand_select)
            elsif name_search != "" && type_select != "" && brand_select != ""
                where("name LIKE? AND type_id = ? AND brand_id = ?","%#{name_search}%", type_select, brand_select)
            else
                all
            end
        else
            all
        end
    end

    has_one_attached :image_product
    has_many :line_items, dependent: :destroy

    belongs_to :type
    belongs_to :brand
end


