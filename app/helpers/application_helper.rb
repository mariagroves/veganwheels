module ApplicationHelper
    def to_pounds(price)
        pricef = price.to_f/100
        '%.2f' % pricef
    end
end
