function pdf = point_distance_1d_pdf ( x, a, b )

%*****************************************************************************80
%
%% POINT_DISTANCE_1D_PDF evaluates the point distance PDF in 1D.
%
%  Discussion:
%
%    It is assumed that a set of points has been generated in 1D
%    according to a Poisson process.  The number of points in a region
%    of size LENGTH is a Poisson variate with mean value B * LENGTH.
%
%    For a point chosen at random, we may now find the nearest
%    Poisson point, the second nearest and so on.  We are interested
%    in the PDF that governs the expected behavior of the distances
%    of rank A = 1, 2, 3, ... with Poisson density B.
%
%    Note that this PDF is a form of the Gamma PDF.???
%
%  Formula:
%
%    PDF(X)(A,B) = B**A * X**( A - 1 ) * EXP ( - B * X ) / ( A - 1 )!
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
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 <= X.
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
    fprintf ( 1, 'POINT_DISTANCE_1D_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input parameter A < 1.\n' );
    error ( 'POINT_DISTANCE_1D_PDF - Fatal error!' );
  end

  if ( b <= 0.0D+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POINT_DISTANCE_1D_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input parameter B <= 0.0.\n' );
    error ( 'POINT_DISTANCE_1D_PDF - Fatal error!' );
  end

  if ( x < 0.0 )
    pdf = 0.0;
  else
    pdf = b^a * x^( a - 1 ) * exp ( - b * x ) / i4_factorial ( a - 1 );
  end

  return
end
