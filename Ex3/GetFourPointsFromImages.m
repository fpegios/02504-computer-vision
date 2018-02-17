function points = GetFourPointsFromImages(im1,im2)

figure
image(im1)
q1=[ginput(1) 1]'
q2 = [ginput(1) 1]'
q3 = [ginput(1) 1]'
q4 = [ginput(1) 1]'
image(im2)
q1_1=[ginput(1) 1]'
q1_2 = [ginput(1) 1]'
q1_3 = [ginput(1) 1]'
q1_4 = [ginput(1) 1]'

points = [q1 q2 q3 q4 q1_1 q1_2 q1_3 q1_4];