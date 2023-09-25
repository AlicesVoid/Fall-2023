function test08()
% Tests Out The Code in the Slides

x = linspace(-pi, pi, 50);
y = sin(x); 
z = cos(x);

subplot(3, 1, 1) % 3 rows, 1 column of plots, will plot the following graph in location 1
plot(x, y, '-.k')

subplot(3, 1, 2) % 3 rows, 1 column of plots, will plot the following graph in location 2
plot(x, z, '-rh')

subplot(3, 1, 3) % 3 rows, 1 column of plots, will plot the following graph in location 3
plot(y, z, '-gh')
