module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    size         = options[:size]
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def options_for_select_from_enum(klass, column)
    enum_list = klass.send(column.to_s.pluralize)
    enum_list.map do | name , _value |
      # selectで使うための組み合わせ順は[ 表示値, value値 ]のため以下の通り設定
      [ t("enums.#{klass.to_s.downcase}.#{column}.#{name}") , name ]
    end
  end
end
