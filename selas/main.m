sela = [
  5 5 1
  1 9 4
  3 1 8
];

results = [ 2; 4; 5 ];

x = [];

for _=1:100
  x = jacobi(sela, results, x);
endfor;

disp(x);