# frozen_string_literal: true

class Ability
  include CanCan::Ability

  
    def initialize(user)
   
           user ||= AdminUser.new # guest user (not logged in)
     
        case user.categoria # a_variable is the variable we want to compare

            when 3 #adm por defecto
              can :manage, :all
            when 1 #adm por defecto
              can :read, ActiveAdmin::Page, :name =>"Dashboard"   
              can [:create,:read,:update], [Product,Formula,Element,Detail]  
            
            else
              can [:read], [Product,Formula]          


         end

     end
end
