%Angular displacement for different damping power
[t,theta] = ode113(@(t,theta) [theta(2); -sin(theta(1))], [0, 20], [pi/4, 0.1]);
plot(t, theta(:, 1))
hold on
for n = [1 3]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -0.21.*(theta(2).^n))], [0, 20], [pi/4, 0.1]);
    plot(t, theta(:, 1))
    xlabel("time")
    ylabel("Angular diaplacement")
    grid on
    hold on
end
legend("0", "1", "3")
hold off

%Angular velocity for different damping power
[t,theta] = ode113(@(t,theta) [theta(2); -sin(theta(1))], [0, 20], [pi/4, 0.1]);
plot(t, theta(:, 2))
hold on
for n = [1 3]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -0.21.*(theta(2).^n))], [0, 20], [pi/4, 0.1]);
    plot(t, theta(:, 2))
    xlabel("time")
    ylabel("Angular Velocity")
    grid on
    hold on
end
legend("0", "1", "3")
hold off

%Phase space plots for different damping power
[t,theta] = ode113(@(t,theta) [theta(2); -sin(theta(1))], [0, 20], [pi/4, 0.1]);
plot(theta(:, 1), theta(:, 2))
hold on
for n = [1 3]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -0.21.*(theta(2).^n))], [0, 20], [pi/4, 0.1]);
    plot(theta(:, 1), theta(:, 2))
    xlabel("Angular displacement")
    ylabel("Angular velocity")
    axis equal
    grid on
    hold on
end
legend("0", "1", "3")
hold off

%Energy for different damping power
[t,theta] = ode113(@(t,theta) [theta(2); -sin(theta(1))], [0, 20], [pi/4, 0.1]);
E = 4.802.*(theta(:, 2).^2) - 9.604.*cos(theta(:, 1)) + 9.604;
plot(t, E)
hold on
for n = [1 3]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -0.21.*(theta(2).^n))], [0, 20], [pi/4, 0.1]);
    E = 4.802.*(theta(:, 2).^2) - 9.604.*cos(theta(:, 1)) + 9.604;
    plot(t, E)
    xlabel("time")
    ylabel("Energy")
    grid on
    hold on
end
legend("0", "1", "3")
hold off
