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
  Sector.find_or_create_by_name_en(item[0],
    description_en: item[1],
    name_id:        item[2],
    description_id: item[3]
  )
end