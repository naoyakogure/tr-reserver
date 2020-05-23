Calendar.create(date: 20200501 ,place: '大研修場')
Calendar.create(date: 20200501 ,place: '中研修場')
Calendar.create(date: 20200501 ,place: '小研修場１')
Calendar.create(date: 20200501 ,place: '小研修場２')
(0..1).each do |number|
  Calendar.create(date: 20200507 + number,place: '大研修場')
  Calendar.create(date: 20200507 + number,place: '中研修場')
  Calendar.create(date: 20200507 + number,place: '小研修場１')
  Calendar.create(date: 20200507 + number,place: '小研修場２')
end
(0..4).each do |number|
  Calendar.create(date: 20200511 + number,place: '大研修場')
  Calendar.create(date: 20200511 + number,place: '中研修場')
  Calendar.create(date: 20200511 + number,place: '小研修場１')
  Calendar.create(date: 20200511 + number,place: '小研修場２')
end
(0..4).each do |number|
  Calendar.create(date: 20200518 + number,place: '大研修場')
  Calendar.create(date: 20200518 + number,place: '中研修場')
  Calendar.create(date: 20200518 + number,place: '小研修場１')
  Calendar.create(date: 20200518 + number,place: '小研修場２')
end
(0..4).each do |number|
  Calendar.create(date: 20200525 + number,place: '大研修場')
  Calendar.create(date: 20200525 + number,place: '中研修場')
  Calendar.create(date: 20200525 + number,place: '小研修場１')
  Calendar.create(date: 20200525 + number,place: '小研修場２')
end