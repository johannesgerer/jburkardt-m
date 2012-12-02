function hermite_polynomial_test14 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST14 tests H_POLYNOMIAL_COEFFICIENTS.
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
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST14\n' );
  fprintf ( 1, '  H_POLYNOMIAL_COEFFICIENTS determines the physicist''s Hermite \n' );
  fprintf ( 1, '  polynomial coefficients.\n' );

  c = h_polynomial_coefficients ( n );
 
  for i = 0 : n
    fprintf ( 1, '\n' );
    fprintf ( 1, '  H(%d) = \n', i );
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
