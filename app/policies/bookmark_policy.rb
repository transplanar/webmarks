class BookmarkPolicy < ApplicationPolicy
  def update?
    # false
    user.present? && (record.topic.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    # false
    user.present? && (record.topic.user == user)
  end
end
