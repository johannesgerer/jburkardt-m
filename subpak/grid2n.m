function x = grid2n ( j, j1, j2, ndim, x1, x2 )

%*****************************************************************************80
%
%% GRID2N computes one grid point between X1 and X2 in N dimensions.
%
%  Discussion:
%
%    However, X1 need not be the first point computed, nor X2 the last.
%    The user must specify the steps on which X1 and X2 are passed through.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer J, the J coordinate of the desired point.
%    Note that if J = J1, X will be returned as X1, and if
%    J = J2, X will be returned as X2.
%
%    Input, integer J1, J2.  J1 specifies the step on which
%    X1 would be computed, and similarly for J2.  That is,
%    we assume that a set of equally spaced points have
%    been drawn on the line through X1 and X2, and that
%    they have been numbered, with X1 labeled J1 and X2
%    labeled J2.  J1 and J2 must be distinct.
%
%    Input, integer NDIM, the dimension of the points X1 and X2.
%
%    Input, real X1(NDIM), X2(NDIM), the points that define
%    the line along which the equally spaced points are
%    generated, and which may or may not be included in the
%    set of computed points.
%
%    Output, real X(NDIM).  X is the J-th point from the
%    set of equally spaced points.
%
  if ( j1 == j2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID2N - Fatal error!\n' );
    fprintf ( 1, '  J1 = J2, leading to zero denominator.\n' );
    fprintf ( 1, '  J1 = %d\n', j1 );
    fprintf ( 1, '  J2 = %d\n', j2 );
    error ( 'GRID2N - Fatal error!' );
  end

  x(1:ndim) = ( ( j2 - j      ) * x1(1:ndim)   ...
              + (      j - j1 ) * x2(1:ndim) ) ...
              / ( j2     - j1 );

  return
end
