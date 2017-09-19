sela = [
  5 5 1
  1 9 4
  3 1 8
];

results = [ 2; 4; 5 ];

x1 = [];
x2 = [];

for _=1:200
  x1 = jacobi(sela, results, x1); % Jacobi is not ok
  x2 = gauss_seidel(sela, results, x2);
endfor;

disp(x1);
disp(x2);