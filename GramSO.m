v1 = [1,2,3];
v2 = [2,1,4];
v3 = [4,2,3];
v = [v1' v2' v3']';
O = gramgv(v);
y = [9 6 14]';
display("Orthogonal vector = ")
X=[O{1}' O{2}' O{3}']'
display("Coefficients = ")
c = inv(X)*y