%Physical properties of pendulum
m = 1;
l = 1;
g = 9.8;
omega_n = sqrt(g/l);

%Angular displacement for different damping values(b)
for b = [0 1 2 3]
    zeta = (b*(l^3))/(2*m*sqrt(g*l));
    [t,theta] = ode113(@(t,theta) [theta(2); (-(omega_n^2).*sin(theta(1)) -(2*zeta*omega_n).*((sign(theta(2))*(theta(2)^2))))], [0, 15], [pi/3, 0]);
    plot(t, theta(:, 1))
    xlabel("time")
    ylabel("Angular displacement")
    grid on
    hold on
end
legend("0", "1", "2", "3")
hold off

%Angular velocity for different damping values(b)
for b = [0 1 2 3]
    zeta = (b*(l^3))/(2*m*sqrt(g*l));
    [t,theta] = ode113(@(t,theta) [theta(2); (-(omega_n^2).*sin(theta(1)) -(2*zeta*omega_n).*((sign(theta(2))*(theta(2)^2))))], [0, 15], [pi/3, 0]);
    plot(t, theta(:, 2))
    xlabel("time")
    ylabel("Angular Velocity")
    grid on
    hold on
end
legend("0", "1", "2", "3")
hold off

%Phase space plots for different damping values(b)
for b = [0 1 2 3]
    zeta = (b*(l^3))/(2*m*sqrt(g*l));
    [t,theta] = ode113(@(t,theta) [theta(2); (-(omega_n^2).*sin(theta(1)) -(2*zeta*omega_n).*((sign(theta(2))*(theta(2)^2))))], [0, 15], [pi/3, 0]);
    plot(theta(:, 1), theta(:, 2))
    xlabel("Angular displacement")
    ylabel("Angular velocity")
    grid on
    hold on
end
legend("0", "1", "2", "3")
hold off

%Energy for different damping values(b)
Q_1 = [];
Q_2 = [];
Q_3 = [];
for b = [1 2 3]
    zeta = (b*(l^3))/(2*m*sqrt(g*l));
    [t,theta] = ode113(@(t,theta) [theta(2); (-(omega_n^2).*sin(theta(1)) -(2*zeta*omega_n).*((sign(theta(2))*(theta(2)^2))))], [0, 15], [pi/3, 0]);
    E = (0.5*m*(l^2)).*(theta(:, 2).^2) + (m*g*l).*(1 - cos(theta(:, 1)));
    plot(t, E)
    xlabel("time")
    ylabel("Energy")
    axis equal
    grid on
    hold on
    A = [];
    for i = 2:length(theta(:, 1))
        if theta(i-1, 1) > 0 && theta(i, 1) < 0
            A = [A; i];
        end
        if theta(i-1, 1) < 0 && theta(i, 1) > 0
            A = [A; i];
        end
    end
    Quality_factor1 = 2*pi*((E(A(1)))/(E(A(1)) - E(A(3))));
    Q_1 = [Q_1; Quality_factor1];
    Quality_factor2 = 2*pi*((E(A(2)))/(E(A(2)) - E(A(4))));
    Q_2 = [Q_2; Quality_factor2];
    Quality_factor3 = 2*pi*((E(A(3)))/(E(A(3)) - E(A(5))));
    Q_3 = [Q_3; Quality_factor3];
end
legend("1", "2", "3")
hold off
Q_1
Q_2
Q_3
