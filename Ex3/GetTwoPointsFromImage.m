function points = GetTwoPointsFromImage(im1,im2)

figure
image(im1)
q1=[ginput(1) 1]'
image(im2)
q2 = [ginput(1) 1]'

points = [q1 q2]