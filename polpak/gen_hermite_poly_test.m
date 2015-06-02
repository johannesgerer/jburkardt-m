function gen_hermite_poly_test ( )

%******************************hermite****************************************80
%
%% GEN_HERMITE_POLY_TEST tests GEN_HERMITE_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2015
%
%  Author:
%
%    John Burkardt
%
  i_test = 6;
  n = 10;

  mu_test = [ 0.0, 0.0, 0.1, 0.1, 0.5, 1.0 ];
  x_test = [ 0.0, 1.0, 0.0, 0.5, 0.5, 0.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEN_HERMITE_POLY_TEST\n' );
  fprintf ( 1, '  GEN_HERMITE_POLY evaluates the generalized Hermite \n' );
  fprintf ( 1, '  polynomials.\n' );

  for i = 1 : i_test

    x = x_test(i);
    mu = mu_test(i);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Table of L(N,MU)(X) for\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    N(max) = %d\n', n );
    fprintf ( 1, '    MU =     %f\n', mu );
    fprintf ( 1, '    X =      %f\n', x );
    fprintf ( 1, '\n' );
  
    c = gen_hermite_poly ( n, x, mu );
 
    for j = 0 : n
      fprintf ( 1, '  %4d  %12f\n', j, c(j+1) );
    end

  end
 
  return
end
