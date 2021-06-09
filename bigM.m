j = 8;
i_eq = 3;
i = 7;

M = 1e10;
%目的関数f_objを設定する
f_obj = zeros(1,j);
f_obj(1,8) = 1;


% A行列を設定する
A = zeros(i,j);
A(1,3) = 1;
A(1,6) = -M;
A(2,1) = -4;
A(2,2) = -5;
A(2,6) = M;
A(3,4) = 1;
A(3,7) = -M;
A(4,1) = -7;
A(4,2) = -8;
A(4,7) = M;
A(5,1) = 4;
A(5,2) = 5;
A(6,1) = 7;
A(6,2) = 8;
A(7,8) = 1;
%Aeq行列を設定する
Aeq = zeros(i_eq, j);
Aeq(1,3) = 4;
Aeq(1,4) = 7;
Aeq(1,5) = 10;
Aeq(2,3) = 5;
Aeq(2,4) = 8;
Aeq(2,5) = -11;
Aeq(3,1) = 10;
Aeq(3,2) = -11;
%b行列を設定する
b = zeros(i,1);
b(2,1) = M-6;
b(4,1) = M-9;
b(5,1) = 6;
b(6,1) = 9;
b(7,1) = 1;
%beq行列を設定する
beq = zeros(i_eq,1);
beq(1,1) = -2;
beq(2,1) = 3;

% lbを設定する
lb = zeros(1,j);
lb(1,5) = -Inf;
clear model;
model.A = [sparse(A);sparse(Aeq)];
model.obj = f_obj;
model.rhs = [b;beq];
model.vtype = ['C','C','C','C','C','B','B','C'];
model.sense = [repmat('<',size(A,1), 1); repmat('=',size(Aeq,1), 1)];
model.lb = lb;
model.modelsense = 'max';
 
result = gurobi(model);
x = result.x;


