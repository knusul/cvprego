module HomeHelper
   def gravatar_tag(email,*args)    
    opts = args.extract_options!
    opts[:class]||=""
    opts[:class]+=" gravatar"
    size = opts.delete(:size) || 512
    require 'digest/md5'
    
    default=""
    if opts[:default]
      require 'cgi'
      default= "&d=#{CGI::escape(opts.delete(:default))}"
    end
    hash = Digest::MD5.hexdigest(email.downcase)    
    img= image_tag "http://www.gravatar.com/avatar/#{hash}?size=#{size}#{default}", opts
    if opts[:profile]
      opts.delete(:profile)
      link_to img,"http://www.gravatar.com/#{hash}",opts
    else
      img
    end
  end

   def image_tag(arg)
     super("#{request.protocol}#{request.host_with_port}#{arg}").html_safe
   end
end
