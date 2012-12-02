function legendre_polynomial_test02 ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST02 tests P_POLYNOMIAL_COEFFICIENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST02\n' );
  fprintf ( 1, '  P_POLYNOMIAL_COEFFICIENTS determines polynomial coefficients of P(n,x).\n' );

  c = p_polynomial_coefficients ( n );
 
  for i = 0 : n
    fprintf ( 1, '\n' );
    fprintf ( 1, '  P(%d,x) = \n', i );
    fprintf ( 1, '\n' );
    for j = i : -1 : 0
      if ( c(i+1,j+1) == 0.0 )

      elseif ( j == 0 )
        fprintf ( 1, '  %g\n', c(i+1,j+1) );
      elseif ( j == 1 )
        fprintf ( 1, '  %g * x\n', c(i+1,j+1) );
      else
        fprintf ( 1, '  %g * x^%d\n', c(i+1,j+1), j );
      end
    end
  end
 
  return
end
