f_obj = [-6, -9, 0];
A = [-4, -7, 10;
    -5, -8, -11];
b = [2; -3];
 
clear model;
model .A = sparse(A);
model .obj = f_obj;
model .rhs = b;
model .sense = repmat('<',size(A,1), 1);
model .modelsense = 'max';
 
clear params;
params.outputflag = 1;
result = gurobi(model, params);
x = result.x;
