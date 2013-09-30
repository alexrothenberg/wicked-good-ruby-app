class SponsorCell < PM::TableViewCell
  attr_accessor :sponsor

  def setup(data_cell, screen)
    super

    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    contentView.subviews.each &:removeFromSuperview
    # contentView.backgroundColor = UIColor.whiteColor
    layout(contentView) do
      logo_view
    end
  end

  def logo_view
    @logo_view = subview UIImageView, :logo, image: UIImage.alloc.initWithContentsOfFile(sponsor.logo_filename)
    if sponsor.logo_missing?
      Updater.download_file("/sponsors/#{sponsor.logo}") do
        @logo_view.image = UIImage.alloc.initWithContentsOfFile sponsor.logo_filename
      end
    end
    @logo_view
  end


end
