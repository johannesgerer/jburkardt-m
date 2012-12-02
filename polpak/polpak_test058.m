function polpak_test058 ( )

%*****************************************************************************80
%
%% TEST058 tests LEGENDRE_POLY_COEF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST058\n' );
  fprintf ( 1, '  LEGENDRE_POLY_COEF determines the Legendre \n' );
  fprintf ( 1, '  P(N) polynomial coefficients.\n' );

  c = legendre_poly_coef ( n );
 
  for i = 0 : n
    fprintf ( 1, '\n' );
    fprintf ( 1, '  P(%d)', i );
    fprintf ( 1, '\n' );
    for j = i : -1 : 0
      if ( j == 0 )
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
