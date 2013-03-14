module ApplicationHelper

 def full_title(page_title)
    base_title = "Bandleader"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def download_url_for(song_key)
    AWS::S3::S3Object.url_for(song_key, BUCKET, :authenticated => false)
  end
  
  
end
