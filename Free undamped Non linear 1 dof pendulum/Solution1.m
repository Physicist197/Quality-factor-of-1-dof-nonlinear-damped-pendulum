Numerical Solution
[t, theta] = ode113('func1', [0, 20], [pi/4, 0]); 

Time series of Angular displacement, Angular velocity, Energy
plot(t,theta(:, 1))
grid on
axis equal
hold on 
plot(t,theta(:, 2))
grid on
axis equal
hold on
E = 4.802.*(theta(:, 2).^2) - 9.604.*cos(theta(:, 1));
plot(t, E)
xlabel("time")
grid on
axis equal
hold off
legend("angular displacement", "angular velocity", "Energy")

Phase Space Plot
plot(theta(:, 2), theta(:, 1))
xlabel("Angular displacement")
ylabel("Angular velocity")
grid on
axis equal
hold off
