function laguerre_polynomial_test06 ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST06 tests LM_POLYNOMIAL_COEFFICIENTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 March 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST06\n' );
  fprintf ( 1, '  LM_POLYNOMIAL_COEFFICIENTS determines polynomial coefficients of Lm(n,m,x).\n' );

  for m = 0 : 4

    c = lm_polynomial_coefficients ( n, m );
 
    for i = 0 : n
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Lm(%d,%d) = \n', i, m );
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

  end
 
  return
end
