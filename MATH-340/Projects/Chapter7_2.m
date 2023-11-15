% Chapter 7 Part 2 Homework: 

% Problem 6:
%

% Initialize the Problem
syms y(t) t;
odesym = diff(y,t) == -1000*(y-sin(t))+cos(t); 
odefun = @(t, y) -1000*(y - sin(t)) + cos(t);
y0 = 1; 
tspan = [0 1];

% Solution By dsolve: 
y_ds(t) = dsolve(odesym, y(0)==1);

% Solve using ode23s and ode23tx
[t_23, y_23] = ode23s(odefun, tspan, y0);
[t_tx, y_tx] = ode23tx(odefun, tspan, y0);
steps_23 = length(t_23);
steps_tx = length(t_tx);
label_23 = append('ode23s  : ',num2str(steps_23), '   steps');
label_tx = append('ode23tx: ',num2str(steps_tx), ' steps');

% Plot the Data
figure(1); clf; hold on; 
fplot(y_ds, [0, 1], 'g','DisplayName', 'dsolve', 'LineWidth',2);
plot(t_tx, y_tx, 'r.', 'DisplayName', label_tx, 'LineWidth',2);
plot(t_23, y_23, 'b.', 'DisplayName', label_23, 'LineWidth',2);
hold off; 
ttl = title('7.6: Comparing ODE Solvers');
lgd = legend('Location', 'best');
fontsize(ttl,18,'points');
fontsize(lgd,14,'points');
lgd; ttl;
fprintf('Number of Steps for ode23  : %d\n', length(t_23))
fprintf('Number of Steps for ode23tx: %d\n', length(t_tx))


%