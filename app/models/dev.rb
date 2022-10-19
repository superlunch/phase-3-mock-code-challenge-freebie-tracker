class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies
  
    def received_one?(item_name)
      # self.freebies.any? do |freebie|
      #   freebie.item_name == item_name
      # end
      self.freebies.exists?(:item_name => item_name)
    end
  
    def give_away(dev, freebie)
      # freebie.update(dev: dev) unless freebie.dev != self
      if(received_one?(freebie.item_name))
        freebie.update(dev_id: dev.id)
      else
        "You can't give what isn't yours!"
    end
end
end

# Don't need the "through" above because ActiveRecord will figure it out

# Dev.second.received_one?("Pen")
# => false

# self.freebies.exists?(:item_name => item_name)

# self.received_one?(freebie.item_name) ? freebie.update(dev_id: dev.id) : "You can't give what isn't yours!"

# if(received_one?(freebie.item_name))
# freebie.update(dev_id: dev.id)
# else
# "You can't give what isn't yours!"