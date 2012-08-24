class Ability
	include CanCan::Ability
	def initialize(user)
		@user = user || User.new # for guest
		@user.roles.each { |role| send(role) }

		if @user.roles.size == 0
			can :read, :all #for guest without roles
			can [:edit, :update], User do |u|
				u.try(:_id) == @user._id
			end
		end
	end

	def admin
		can :manage, :all
		cannot [:destroy], User do |u|
				u.try(:_id) == @user._id
		end
		can :assign_roles, User
	end
end