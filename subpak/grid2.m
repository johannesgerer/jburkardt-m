function x = grid2 ( i1, i2, ndim, nstep, x1, x2 )

%*****************************************************************************80
%
%% GRID2 computes grid points between X1 and X2 in N dimensions.
%
%  Discussion:
%
%    However, X1 need not be the first point computed, nor X2 the last.
%    The user must specify the steps on which X1 and X2 are passed
%    through.  These steps may even be outside the range of 1 through NSTEP.
%
%    We assume that a set of equally spaced points have
%    been drawn on the line through X1 and X2, and that
%    they have been numbered, with X1 labeled I1 and X2
%    labeled I2.  I1 or I2 may be between 1 and NSTEP,
%    in which case X1 or X2 will actually be returned in the
%    X array, but there is no requirement that I1 or I2
%    satisfy this condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1, I2.  I1 specifies the step on which
%    X1 would be computed, and similarly for I2.
%    I1 and I2 must be distinct.
%
%    Input, integer NDIM, the dimension of the points X1 and X2.
%
%    Input, integer NSTEP, this is the number of equally
%    spaced points that are to be generated.
%    NSTEP should be at least 1.
%
%    Input, real X1(NDIM), X2(NDIM), the points that define
%    the line along which the equally spaced points are generated, and
%    which may or may not be included in the set of computed points.
%
%    Output, real X(NDIM,NSTEP), the set of equally spaced points.
%    Each column of X represents one point.
%    If 1 <= I1 <= NSTEP, then X(*,I1) = X1, and similarly for I2.
%
  if ( i1 == i2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID2 - Fatal error!\n' );
    fprintf ( 1, '  I1 = I2, leading to zero denominator.\n' );
    fprintf ( 1, '  I1 = %d\n', i1 );
    fprintf ( 1, '  I2 = %d\n', i2 );
    error ( 'GRID2 - Fatal error!' );
  end

  for i = 1 : nstep
    for j = 1 : ndim
      x(j,i) = ( ( i2 - i      ) * x1(j)   ...
               + (      i - i1 ) * x2(j) ) ...
               / ( i2     - i1 );
    end
  end

  return
end
