class FamilyBuilder
  attr_reader :family_params, :user
  def initialize(family_params, user)
    @family_params = family_params
    @user = user
  end

  def build
    if user.has_family?
      false
    else
      create_family_with_membership
      true
    end
  end

  private

  def create_family_with_membership
    family = Family.new(family_params)
    if family.save
      FamilyMembership.create(family: family, user: user)
      true
    end
  end
end
