function grid_triangular ( xval, yval, ngrid )

%*****************************************************************************80
%
%% GRID_TRIANGULAR draws a triangular grid.
%
%  Example:
%
%    axis ( [ 0.0, 1.0, 0.0, 1.0 ] );
%    xval = [ 0.0, 1.0, 0.25 ];
%    yval = [ 0.0, 0.0, 1.00 ];
%    grid_triangular ( xval, yval, ngrid );
%    xlabel ( 'X' )
%    ylabel ( 'Y' )
%    title ( 'Triangular grid' )
%    axis equal
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XVAL(3), YVAL(3), the X and Y coordinates
%    of the three sides of the triangle.
%
%    Input, integer NGRID, the number of hatch lines to
%    be drawn.  Each side of the triangle, and NHATCH equally
%    spaced lines parallel to that side, and interior to
%    the triangle will be drawn, for a total of 3*(NHATCH+1) lines.
%
  color = [ 0.75, 0.75, 0.75 ];

  for i = 1 : 3
 
    i1 = i;
 
    i2 = i + 1;
    if ( 3 < i2 )
      i2 = i2 - 3;
    end
 
    i3 = i + 2;
    if ( 3 < i3 )
      i3 = i3 - 3;
    end
 
    for j = 0 : ngrid
 
      xlo = ( j * xval(i1) + ( ngrid + 1 - j ) * xval(i2) ) / ( ngrid + 1 );
      ylo = ( j * yval(i1) + ( ngrid + 1 - j ) * yval(i2) ) / ( ngrid + 1 );
 
      xhi = ( j * xval(i1) + ( ngrid + 1 - j ) * xval(i3) ) / ( ngrid + 1 );
      yhi = ( j * yval(i1) + ( ngrid + 1 - j ) * yval(i3) ) / ( ngrid + 1 );
 
      line ( [ xlo, xhi ], [ ylo, yhi ], 'Color', color );

    end
 
  end
 
  return
end
