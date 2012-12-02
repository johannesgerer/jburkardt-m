function polpak_test052 ( )

%*****************************************************************************80
%
%% TEST052 tests GEN_LAGUERRE_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2010
%
%  Author:
%
%    John Burkardt
%
  i_test = 6;
  n = 10;

  alpha_test = [ 0.0, 0.0, 0.1, 0.1, 0.5, 1.0 ];
  x_test = [ 0.0, 1.0, 0.0, 0.5, 0.5, 0.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST052\n' );
  fprintf ( 1, '  GEN_LAGUERRE_POLY evaluates the generalized Laguerre \n' );
  fprintf ( 1, '  polynomials.\n' );

  for i = 1 : i_test

    x = x_test(i);
    alpha = alpha_test(i);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Table of L(N,ALPHA)(X) for\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    N(max) = %d\n', n );
    fprintf ( 1, '    ALPHA =  %f\n', alpha );
    fprintf ( 1, '    X =      %f\n', x );
    fprintf ( 1, '\n' );
  
    c = gen_laguerre_poly ( n, alpha, x );
 
    for j = 0 : n
      fprintf ( 1, '  %4d  %12f\n', j, c(j+1) );
    end

  end
 
  return
end
