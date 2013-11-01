Handlebars.registerHelper "ifCond", (v1, operator, v2, options) ->
  switch operator
    when "=="
      (if (v1 is v2) then options.fn(this) else options.inverse(this))
    when "!="
      (if (v1 isnt v2) then options.fn(this) else options.inverse(this))
    when "==="
      (if (v1 is v2) then options.fn(this) else options.inverse(this))
    when "!=="
      (if (v1 isnt v2) then options.fn(this) else options.inverse(this))
    when "&&"
      (if (v1 and v2) then options.fn(this) else options.inverse(this))
    when "||"
      (if (v1 or v2) then options.fn(this) else options.inverse(this))
    when "<"
      (if (v1 < v2) then options.fn(this) else options.inverse(this))
    when "<="
      (if (v1 <= v2) then options.fn(this) else options.inverse(this))
    when ">"
      (if (v1 > v2) then options.fn(this) else options.inverse(this))
    when ">="
      (if (v1 >= v2) then options.fn(this) else options.inverse(this))
    else
      (if eval("" + v1 + operator + v2) then options.fn(this) else options.inverse(this))

