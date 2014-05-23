class WikiPolicy < ApplicationPolicy

  def initialize(wiki)
    @wiki = wiki
  end

  def allow_to_add_collaboration?(collaborator)
    @wiki.user.premium && collaborator.present?
  end
end
