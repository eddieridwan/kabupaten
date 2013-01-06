sectors = [
  ["Water and sanitation","","Air dan sanitasi", ""],
  ["Health","","Kesehatan",""],
  ["Education","","Pendidikan",""],
  ["Shelter","","Naungan",""],
  ["Human rights","","Hak azazi manusia",""],
  ["Livelihood","","Mata pencaharian",""],
  ["Finance","","Keuangan",""],
  ["Environment","","Lingkungan",""]
]

sectors.each do |item|
  I18n.locale = :en
  sector = Sector.find_or_create_by_name(item[0], description: item[1])
  I18n.locale = :id
  sector.update_attributes(name: item[2], description: item[3])
end