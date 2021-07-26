class Role < ActiveRecord::Base 
    has_many :auditions

    def actors 
        self.auditions.pluck('actor')
    end
    def locations
        self.auditions.pluck('location')
    end
    def lead
        self.auditions.first
    end
    def understudy
        if self.auditions.count > 1
            self.auditions[1]
        else
            'no actor has been hired for understudy for this role'
        end
    end


end