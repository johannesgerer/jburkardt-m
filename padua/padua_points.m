function xy = padua_points ( l )

%*****************************************************************************80
%
%% PADUA_POINTS returns the Padua points of level L.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Bivariate interpolation on the square at new nodal sets,
%    Applied Mathematics and Computation,
%    Volume 165, Number 2, 2005, pages 261-274.
%
%  Parameters:
%
%    Input, integer L, the level of the set.
%    0 <= L
%
%    Output, real XY(2,N), the Padua points of level L.
%
  n = ( ( l + 1 ) * ( l + 2 ) ) / 2;

  xy = zeros ( 2, n );

  if ( l == 0 )
    xy(1,1) = 0.0;
    xy(2,1) = 0.0;
    return
  end

  k = 0;

  for i = 0 : l

    j_hi = floor ( l / 2 ) + 1;
    if ( mod ( l, 2 ) == 1 && mod ( i, 2 ) == 1 )
      j_hi = j_hi + 1;
    end;

   for j = 1 : j_hi

     k = k + 1;

      if ( i * 2 == l )
        xy(1,k) = 0.0;
      else
        angle1 = i * pi / l;
        xy(1,k) = cos ( angle1 );
      end

      if ( mod ( i, 2 ) == 0 )
        if ( 2 * ( 2 * j - 1 ) == l + 1 ) 
          xy(2,k) = 0.0;
        else
          angle2 = ( 2 * j - 1 ) * pi / ( l + 1 );
          xy(2,k) = cos ( angle2 );
        end
      else
        if ( 2 * ( 2 * j - 2 ) == l + 1 ) 
          xy(2,k) = 0.0;
        else
          angle2 = ( 2 * j - 2 ) * pi / ( l + 1 );
          xy(2,k) = cos ( angle2 );
        end
      end

    end

  end

  return
end
