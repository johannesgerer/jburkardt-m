function x = grid3n ( i, j, ndim, nstep1, nstep2, x1, x2, x3 )

%*****************************************************************************80
%
%% GRID3N computes a parallelogram grid on 3 points in N dimensions.
%
%  Discussion:
%
%    The line between X1 and X2 will have NSTEP1
%    points generated along it, and the line between X1 and
%    X3 will have NSTEP2 points generated along it.
%
%    The following special values are:
%
%      I       J         X
%
%      1       1         X1
%      NSTEP1  1         X2
%      1       NSTEP2    X3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the parallelogram coordinates
%    of the point.  I measures steps from X1 to X2, and
%    J measures steps from X1 to X3.  Normally, I would
%    be between 1 and NSTEP1, J between 1 and NSTEP2,
%    but this is not necessary.
%
%    Input, integer NDIM, the dimension of the points X1, X2 and X3.
%
%    Input, integer NSTEP1, NSTEP2.  These are the number of
%    equally spaced points to generate in the first and second
%    directions.  NSTEP1 and NSTEP2 must be at least 2, because X1, X2 and
%    X3 are always included in the set of points.
%
%    Input, real  X1(NDIM), X2(NDIM), X3(NDIM), the points
%    which define three corners of the parallelogram on
%    which the grid will be generated.
%
%    Output, real X(NDIM), the point with coordinates (I,J)
%    from the the set of equally  spaced points.  
%
  if ( nstep1 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID3N - Fatal error!\n' );
    fprintf ( 1, '  NSTEP1 <= 1.\n' );
    fprintf ( 1, '  NSTEP1 = %d\n', nstep1 );
    error ( 'GRID3N - Fatal error!' );
  end

  if ( nstep2 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID3N - Fatal error!\n' );
    fprintf ( 1, '  NSTEP2 <= 1.\n' );
    fprintf ( 1, '  NSTEP2 = %d\n', nstep2 );
    error ( 'GRID3N - Fatal error!' );
  end

  psi2 = ( i - 1 ) / ( nstep1 - 1 );
  psi3 = ( j - 1 ) / ( nstep2 - 1 );
  psi1 = 1.0 - psi2 - psi3;

  x(1:ndim) = psi1 * x1(1:ndim) + psi2 * x2(1:ndim) + psi3 * x3(1:ndim);

  return
end
