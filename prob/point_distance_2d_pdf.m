function pdf = point_distance_2d_pdf ( x, a, b )

%*****************************************************************************80
%
%% POINT_DISTANCE_2D_PDF evaluates the point distance PDF in 2D.
%
%  Discussion:
%
%    It is assumed that a set of points has been generated in 2D
%    according to a Poisson process.  The number of points in a region
%    of size AREA is a Poisson variate with mean value B * AREA.
%
%    For a point chosen at random, we may now find the nearest
%    Poisson point, the second nearest and so on.  We are interested
%    in the PDF that governs the expected behavior of the distances
%    of rank A = 1, 2, 3, ... with Poisson density B.
%
%  Formula:
%
%    PDF(X)(A,B) = 2 * ( B * PI )**A * X**( 2 * A - 1 )
%      * EXP ( - B * PI * X * X ) / ( A - 1 )!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, pages 579.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0D+00 <= X.
%
%    Input, integer A, indicates the degree of nearness of the point.
%    A = 1 means the nearest point, A = 2 the second nearest, and so on.
%    0 < A.
%
%    Input, real B, the point density.  0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( a < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POINT_DISTANCE_2D_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input parameter A < 1.\n' );
    error ( 'POINT_DISTANCE_2D_PDF - Fatal error!' );
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POINT_DISTANCE_2D_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input parameter B <= 0.0.\n' );
    error ( 'POINT_DISTANCE_2D_PDF - Fatal error!' );
  end

  if ( x < 0.0 )
    pdf = 0.0;
  else
    pdf = 2.0 * ( b * pi )^a * x^( 2 * a - 1 ) ...
      * exp ( - b * pi * x^2 ) / i4_factorial ( a - 1 );
  end

  return
end
