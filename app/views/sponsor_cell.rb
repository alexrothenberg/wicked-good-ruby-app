class SponsorCell < PM::TableViewCell
  attr_accessor :sponsor

  def setup(data_cell, screen)
    super

    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    contentView.subviews.each &:removeFromSuperview
    # contentView.backgroundColor = UIColor.whiteColor
    layout(contentView) do
      logo_view = subview(UIImageView, :logo, image: UIImage.imageNamed("sponsors/#{sponsor.logo}"))
    end
  end

end
