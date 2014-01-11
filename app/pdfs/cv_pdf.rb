require "prawn/measurement_extensions"
class CvPdf < Prawn::Document

  def initialize(args = {})
    @user = args.fetch :user
    @card = @user.card
    super(:page_size => "A4", :left_margin => 20.5.mm, :top_margin => 20.5.mm, :right_margin => 20.5.mm)
    font "lib/GandhiSans-Regular.ttf"
    structure_of_page
  end

  def filename
    "#{@card.first_name}_#{@card.last_name}.pdf"
  end

  private
  def hline
    move_down 5
    stroke_dashed_horizontal_line(0, 12.cm, :line_length => 1.0.cm, :space_length => 1.mm)
    move_down 15
  end
  def structure_of_page
    card
    hline
    skills
    hline
    experiences
    hline
    educations
    hline
    languages
    hline
    hobbies
  end

  private

  def header(text)
    move_down 5
    text text, size: 16
    move_down 10
  end

  def languages
    return if @user.languages.empty?
    header "Languages"
    @user.languages.each do |language|
      text ("#{language.name} #{language.level}")
    end
  end

  def hobbies
    return if @user.hobbies.empty?
    header "Hobbies"
    @user.hobbies.each do |hobby|
      text hobby.name
    end
  end

  def experiences
    return if @user.experiences.empty?
    header "Proffesional experience"
    @user.experiences.each do |experience|
      position = cursor
      bounding_box([0, position], :width => 150) do
        text "#{experience.from_date} - #{experience.to_date}"
      end

      bounding_box([180, position], :width => 350) do
        text "#{experience.role}: #{experience.company_name}"
        text experience.description
      end
    end
  end

  def educations
    return if @user.educations.empty?
    header "Education"
    @user.educations.each do |education|
      position = cursor
      bounding_box([0, position], :width => 150) do
        text "#{education.from_date} - #{education.to_date}"
      end

      bounding_box([180, position], :width => 350) do
        text education.name
      end
    end
  end

  def skills
    header "Key skills"
    @user.skills.each do |skill|
      text skill.name
    end
  end

  def card
    float do
      image @card.photo.path, scale: 0.50, position: :right, top_margin: 16.mm
    end
    text @card.first_name, size: 20
    text @card.last_name, size: 20 
    @card.contact_types.each do |contact_type|
      text "#{contact_type.name}: #{contact_type.number}", size: 12
    end
  end
end
module Prawn::Graphics
  # E.g. stroke_dashed_horizontal_line(0, 5.cm, :at => 10.cm, :line_length => 1.cm, :space_length => 1.mm)
  # Currently rounds up line/space periods: 1 cm line length + 1 mm space as a 3 cm line would be "- - -", 3.2 cm total.
  def stroke_dashed_horizontal_line(x1,x2,options={})
    options = options.dup
    line_length = options.delete(:line_length) || 0.5.mm
    space_length = options.delete(:space_length) || line_length
    period_length = line_length + space_length
    total_length = x2 - x1
 
    (total_length/period_length).ceil.times do |i|
      left_bound = x1 +  i * period_length
      stroke_horizontal_line(left_bound, left_bound + line_length, options)
    end
  end
end
