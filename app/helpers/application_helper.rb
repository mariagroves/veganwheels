module ApplicationHelper
    def to_pounds(price)
        pricef = price.to_f/100
        '%.2f' % pricef
    end

    def flash_class(level)
        case level
            when "notice" then "alert alert-secondary"
            when "success" then "alert alert-success"
            when "error" then "alert alert-danger"
            when "alert" then "alert alert-danger"
        end
    end
end
