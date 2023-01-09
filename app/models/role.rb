class Role < ActiveRecord::Base
    has_many :auditions

    def auditions 
        self.auditions.all
    end

    def actors 
        self.auditions.all.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.all.map do |audition|
            audition.location
        end
    end

    def lead
        lead = self.auditions.all.find_by(:hired => true)
        lead.first ? lead : "no actor has been hired for this role"
    end

    def understudy 
        understudy = self.auditions.all.find_by(:hired => true)
        understudy.second ? lead : "no actor has been hired for this role"
    end

end