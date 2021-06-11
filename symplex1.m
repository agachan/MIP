f_obj = [2, -3];
A = [-4,-5;
    -7,-8];
b = [-6;-9];
Aeq = [10,-11];
beq = [0];
lb = [0,0];
 
clear model;
model .A = [sparse(A);sparse(Aeq)];
model .obj = f_obj;
model .rhs = [b;beq];
model .sense = [repmat('>',size(A,1), 1); repmat('=',size(Aeq,1), 1)];
model .lb = lb;
model .modelsense = 'min';
 
clear params;
params.outputflag = 1;
result = gurobi(model, params);
x = result.x;
pi = result.pi;


