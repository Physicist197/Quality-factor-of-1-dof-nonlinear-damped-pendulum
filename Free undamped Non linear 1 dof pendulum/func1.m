function thetadot = func1(t, theta) 
thetadot(1) = theta(2); 
thetadot(2) = -sin(theta(1)); 
thetadot = thetadot'; 
end
