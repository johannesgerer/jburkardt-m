function determ = tris_determinant ( n, x, y, z )

%*****************************************************************************80
%
%% TRIS_DETERMINANT returns the determinant of the TRIS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X, Y, Z, parameters.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;

  if ( 0.0 <= x * z )

    for i = 1 : n
      angle = i * pi / ( n + 1 );
      determ = determ * ( y + 2.0 * sqrt ( x * z ) * cos ( angle ) );
    end

  else

    i_hi = floor ( n / 2 );

    for i = 1 : i_hi
      angle = i * pi / ( n + 1 );
      determ = determ * ( y^2 - 4.0 * x * z * cos ( angle )^2 );
    end

    if ( mod ( n, 2 ) == 1 )
      determ = determ * y;
    end

  end

  return
end
