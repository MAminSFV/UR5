function [J,T0,T,R0,R,Z,P0] = Geometric_Jacobian_Sym(n,is_rev,a,alpha,d,theta)
%Notes: The first index of T,Z,R cell array should be summed with 1 i.e. index 1 refers to 0(base) frame 
%Compute Transformation Matrices for joint i about i-1 ... Be Carefull about indices!
for i=1:n
    T{i-1+1,i} = [cos(theta(i)) -sin(theta(i))*cos(alpha(i)) sin(theta(i))*sin(alpha(i)) a(i)*cos(theta(i))
        sin(theta(i)) cos(theta(i))*cos(alpha(i)) -cos(theta(i))*sin(alpha(i)) a(i)*sin(theta(i))
        0 sin(alpha(i)) cos(alpha(i)) d(i)
        0 0 0 1];
end

%Compute Transformation Matrices for joint i about 0
T0{1} = T{1-1+1,1};
for i=2:n
    T0{i} = T0{i-1}*T{i-1+1,i};
end

%Compute Rotation Matrices about 0
for i=1:n
   R0{i} = T0{i}(1:3,1:3);
end

%Compute Rotation Matrix for joint i about i-1
for i=1:n
   R{i-1+1,i} = T{i-1+1,i}(1:3,1:3); 
end

%Compute Z(i) ... Be Careful about indices!
Z{0+1} = [0 0 1]';
for i=1:n
    Z{i+1} = R0{i}*[0 0 1]';
end

%Compute P(0,i)
for i=1:n
    P0{i} = T0{i}(1:3,4);
end


%Compute Jacobian Matrix
if is_rev(1)
    J(1:3,1) = cross(Z{1-1+1},P0{n});
    J(4:6,1) = Z{1-1+1};
else
    J(1:3,1) = Z{1-1+1};
    J(4:6,1) = [0 0 0]';
end
for i=2:n
    if is_rev(i)
        J(1:3,i) = cross(Z{i-1+1},(P0{n}-P0{i-1}));
        J(4:6,i) = Z{i-1+1};
    else
        J(1:3,i) = Z{i-1+1};
        J(4:6,i) = [0 0 0]';
    end
end

% J = simplify(J);

end