type = ARGV[0]
angle = ARGV[1].to_f

if type.downcase == "d"
    new_angle = (angle * -1) + 90
    new_angle += 360 if new_angle < 0
    new_angle -= 360 if new_angle > 360
    puts new_angle
elsif type.downcase == "b"
    new_angle = (angle - 90) * -1
    new_angle += 360 if new_angle < 0
    new_angle -= 360 if new_angle > 360
    puts new_angle
end
