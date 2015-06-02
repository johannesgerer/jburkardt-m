function poly_print ( d, p, title )

%*****************************************************************************80
%
%% POLY_PRINT prints an XY polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the degree of the polynomial.
%
%    Output, real P(M), the coefficients of all monomials of degree 0 through D.
%    P must contain ((D+1)*(D+2))/2 entries.
%
%    Input, string TITLE, a title string.
%
  m = ( ( d + 1 ) * ( d + 2 ) ) / 2;

  if ( all ( p(1:m) == 0.0 ) )

    fprintf ( 1, '%s = 0.0\n', title );

  else

    fprintf ( 1, '%s = \n', title );

    for k = 1 : m

      [ i, j ] = i4_to_pascal ( k );
      di = i + j;

      if ( p(k) ~= 0.0 )
        if ( p(k) < 0.0 )
          fprintf ( 1, '  %g', p(k) );
        else
          fprintf ( 1, '  +%g', p(k) );
        end
        if ( di ~= 0 )
          fprintf ( 1, ' ' );
        end
        if ( i == 0 )
        elseif ( i == 1 )
          fprintf ( 1, 'x' )
        else
          fprintf ( 1, 'x^%d', i )
        end
        if ( j == 0 )
        elseif ( j == 1 )
          fprintf ( 1, 'y' )
        else
          fprintf ( 1, 'y^%d', j )
        end
        fprintf ( 1, '\n' );
      end

    end

  end

  return
end
