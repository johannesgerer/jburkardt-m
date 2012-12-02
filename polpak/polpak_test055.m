function polpak_test055 ( )

%*****************************************************************************80
%
%% TEST055 tests LAGUERRE_POLY_COEF.
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
  fprintf ( 1, 'TEST055\n' );
  fprintf ( 1, '  LAGUERRE_POLY_COEF determines the Laguerre \n' );
  fprintf ( 1, '  polynomial coefficients.\n' );

  c = laguerre_poly_coef ( n );
 
  for i = 0 : n
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L(%d)\n', i );
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
 
  fact = 1.0;

  for i = 0 : n

    if ( 0 < i )
      fact = fact * i;
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Factorially scaled L(%d)\n', i );
    fprintf ( 1, '\n' );

    for j = i : -1 : 0
      if ( j == 0 )
        fprintf ( 1, '  %f\n', fact * c(i+1,j+1) );
      elseif ( j == 1 )
        fprintf ( 1, '  %f * x\n', fact * c(i+1,j+1) );
      else
        fprintf ( 1, '  %f * x^%d\n', fact * c(i+1,j+1), j );
      end
    end
    
  end

  return
end
