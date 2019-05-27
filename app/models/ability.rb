# frozen_string_literal: true

class Ability
  include CanCan::Ability

  
    def initialize(user)
   
           user ||= AdminUser.new # guest user (not logged in)
     
        case user.categoria # a_variable is the variable we want to compare
           when 1
             

            # can :read, ActiveAdmin::Page, :name =>"Epyg"
            # can :read, ActiveAdmin::Page, :name =>"Dashboard"
            # can :read, ActiveAdmin::Page, :name =>"grafico"
            # can :read, ActiveAdmin::Page, :name =>"Dpc"
             can [:create,:read,:update,:destroy], [Product,Formula]
             

            when 3 #adm por defecto
              can :manage, :all


        end

    end
end
