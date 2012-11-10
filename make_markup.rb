require 'rubygems'
require 'json'

school_table = ""

end_list = <<END
<span class="right" data-role="button" data-theme="b" data-inline="true" data-mini="true"><a class="btn-rate" href="#">Rate Course</a></span>
				<span class="right" data-role="button" data-inline="true" data-mini="true"><a class="btn-learn" href="#">Learn More</a></span>
			</li>
END

file = File.open("class-data.txt")
text = file.read

file.close

text_json = JSON.parse(text)

text_json.each do
  | school_name | school_table += "<li data-role=\"list-divider\">#{school_name[0]}<\/li>"

  school_name[1].each do
    | class_obj | school_table += "<li data-filtertext=\"" + class_obj["keywords"] + "\">" + class_obj["title"] + end_list
  end

end

open("class-html.txt", "w") do |f|
  f.puts school_table
end
