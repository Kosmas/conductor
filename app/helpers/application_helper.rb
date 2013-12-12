module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Conductor").join(" - ")
      end
    end
  end

	def admins_only(&block)
		block.call if current_user.try(:admin?)
	end

  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) || current_user.try(:admin?)
  end
end
