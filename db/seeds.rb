list = List.find_or_create_by!(name: "Featured")

movie = Movie.find_or_create_by!(title: "Inception", original_title: "Inception", year: 2010)
tv_show = TvShow.find_or_create_by!(title: "Breaking Bad", original_title: "Breaking Bad", year: 2008)
season = Season.find_or_create_by!(tv_show: tv_show, number: 1) do |s|
  s.title = "Season 1"
  s.original_title = "Season 1"
  s.year = 2008
end
episode = Episode.find_or_create_by!(season: season, number: 1) do |e|
  e.title = "Pilot"
  e.original_title = "Pilot"
  e.year = 2008
end

[
  [ movie, 1 ],
  [ tv_show, 2 ],
  [ season, 3 ],
  [ episode, 4 ]
].each do |content, position|
  ListItem.find_or_create_by!(list: list, content: content) do |item|
    item.position = position
  end
end
