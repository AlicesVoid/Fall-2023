% Chapter 7 Part 1 Homework: 

% Problem 6:
%

% Initialize the Problem
ode = @(t, y) -1000*(y - sin(t)) + cos(t);
y0 = 1; 
tspan = [0 1];

% Solution By Hand: 
[t_e, y_e] = myEuler(ode, tspan, y0, 1e-3);

% Solve using ode23s and ode23tx
[t_23, y_23] = ode23s(ode, tspan, y0);
[t_tx, y_tx] = ode23tx(ode, tspan, y0);
steps_23 = length(t_23);
steps_tx = length(t_tx);
label_23 = append('ode23s: ',num2str(steps_23), ' steps');
label_tx = append('ode23tx: ',num2str(steps_tx), ' steps');

% Plot the Data
figure(1); clf; hold on; 
plot(t_23, y_23, 'b.', 'DisplayName', label_23);
plot(t_tx, y_tx, 'r.', 'DisplayName', label_tx);
hold off; 
ttl = title('Amelia Rotondo, 7.6: Comparing ODE Solvers');
lgd = legend('Location', 'best');
fontsize(ttl,18,'points');
fontsize(lgd,14,'points');
lgd; ttl;

%