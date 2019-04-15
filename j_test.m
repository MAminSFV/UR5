syms q1 q2 q3 q4 q5 q6;
theta=[q1 q2 q3 q4 q5 q6];
alpha=[-pi/2 0 0 pi/2 -pi/2 0];
a=[0 -425 -392 0 0 0 ];
d=[89.2 0 0 109.3 94.75 82.5];
is_rev=[1 1 1 1 1 1];
n=6;
J=Geometric_Jacobian_Sym(n,is_rev,a,alpha,d,theta)


 theta=[ -pi/2 pi/3 pi/5 1.2 0.2 0];
 
 J=Geometric_Jacobian_Sym(n,is_rev,a,alpha,d,theta)