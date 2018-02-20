class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki, :collaborator
    
    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end
    
    class Scope                                                                 #copy pasted from the checkpoint, seems to need no changes
     attr_reader :user, :scope
 
     def initialize(user, scope)                                                #is this redundant code?
       @user = user
       @scope = scope
     end
    
    class Scope
        attr_reader :user, :scope
        
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
        
        def resolve
            wikis = []
            if user.nil?
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if wiki.private == false
                        wikis << wiki
                    end
                end
            elsif user.admin?
                wikis = scope.all
            elsif user.premium?
                all_wikis = scope.all
                wikis = []
                collaborators = []
                all_wikis.each do |wiki|
                    wiki.collaborators.each do |collaborator|
                        collaborators << collaborator.email
                    end
                    if wiki.private == false || wiki.user == user || collaborators.include?(user.email)
                        wikis << wiki
                    end
                end
            else
                all_wikis = scope.all
                wikis = []
                collaborators = []
                all_wikis.each do |wiki|
                    wiki.collaborators.each do |collaborator|
                        collaborators << collaborator.email
                    end
                    if wiki.private == false || collaborators.include?(user.email)
                        wikis << wiki
                    end
                end
            end
            wikis
        end
    
    def create?
        user.admin? || user.premium?
    end
    
    def new?
        create?
    end
    
    def update?
        user.present?
    end
    
    def edit?
        update?
    end
    
    def destroy?
        user.admin? || (@wiki.user == user)
    end
end
