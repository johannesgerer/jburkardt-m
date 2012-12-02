function chebyshev_polynomial_test11 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST11 tests U_POLYNOMIAL_COEFFICIENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST11\n' );
  fprintf ( 1, '  U_POLYNOMIAL_COEFFICIENTS determines the\n' );
  fprintf ( 1, '  polynomial coefficients for U(n,x).\n' );

  c = u_polynomial_coefficients ( n );
 
  for i = 0 : n
    fprintf ( 1, '\n' );
    fprintf ( 1, '  U(%d,x) = \n', i );
    fprintf ( 1, '\n' );
    for j = i : -1 : 0
      if ( c(i+1,j+1) == 0.0 )

      elseif ( j == 0 )
        fprintf ( 1, '  %f\n', c(i+1,j+1) );
      elseif ( j == 1 )
        fprintf ( 1, '  %f * x\n', c(i+1,j+1) );
      else
        fprintf ( 1, '  %f * x^%d\n', c(i+1,j+1), j );
      end
    end
  end

  return
end
