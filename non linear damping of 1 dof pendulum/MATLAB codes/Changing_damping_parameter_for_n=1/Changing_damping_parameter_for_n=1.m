%Angular displacement for different damping values(b)
for a = [0 3 9.604 12]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -(a/9.604).*theta(2))], [0, 20], [pi/4, 0.1]);
    plot(t, theta(:, 1))
    xlabel("time")
    ylabel("Angular diaplacement")
    grid on
    hold on
end
legend("0", "3", "9.604", "12")
hold off

%Angular velocity for different damping values(b)
for a = [0 3 9.604 12]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -(a/9.604).*theta(2))], [0, 20], [pi/4, 0.1]);
    plot(t, theta(:, 2))
    xlabel("time")
    ylabel("Angular Velocity")
    grid on
    hold on
end
legend("0", "3", "9.604", "12")
hold off

%Phase space plots for different damping values(b)
for a = [0 3 9.604 12]
    [t,theta] = ode113(@(t,theta) [theta(2); (-sin(theta(1)) -(a/9.604).*theta(2))], [0, 20], [pi/4, 0.1]);
    plot(theta(:, 1), theta(:, 2))
    xlabel("Angular displacement")
    ylabel("Angular velocity")
    axis equal
    grid on
    hold on
end
legend("0", "3", "9.604", "12")
hold off

%Energy for different damping values(b)
for a = [0 3 9.604 12]
    [t,theta] = ode113(@(t,theta) [theta(2); (-(a/9.604).*theta(2) -sin(theta(1)))], [0, 20], [pi/4, 0.1]);
    E = 4.802.*(theta(:, 2).^2) - 9.604.*cos(theta(:, 1)) + 9.604;
    plot(t, E)
    xlabel("time")
    ylabel("Energy")
    grid on
    hold on
end
legend("0", "3", "9.604", "12")
hold off
