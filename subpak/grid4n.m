function x = grid4n ( i, i1, i2, j, j1, j2, ndim, nstep1, nstep2, x1, x2, x3 )

%*****************************************************************************80
%
%% GRID4N computes a single point on a parallelogram grid in N space.
%
%  Discussion:
%
%    The computation is identical to that of GRID4, except that
%    only one point at a time is computed.
%
%    The line through X1 and X2 will have NSTEP1
%    points generated along it, and the line through X1 and
%    X3 will have NSTEP2 points generated along it.
%
%    The following special values will be computed:
%
%      I  J  X
%
%      I1 J1 X1
%      I2 J2 X2
%      I1 J2 X3
%
%    If we imagine that the main parallelogram is drawn first, with
%    coordinate ranges 1 <= I <= NSTEP1 and 1 <= J <= NSTEP2, then
%    the indices I and J determine the (I,J) coordinates of the
%    three points X1, X2, and X3, namely:
%
%      X1 : (I1,J1)
%      X2 : (I2,J1)
%      X3 : (I1,J2)
%
%    Of course, we actually start with the points X1, X2,
%    and X3, and they define a parallelogram and an (I,J)
%    coordinate system over the plane containing them.  We
%    then are free to consider the parallelogram defined
%    by the three points (1,1), (NSTEP1,1) and (1,NSTEP2),
%    which may or may not contain any of the points X1, X2
%    and X3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the I coordinate of the point X.
%
%    Input, integer I1, I2.  See discussion.
%
%    Input, integer J, the J coordinate of the point X.
%
%    Input, integer J1, J2.  See discussion.
%
%    Input, integer NDIM, the dimension of the points X, X1, X2 and X3.
%
%    Input, integer NSTEP1, NSTEP2.  These are the number of
%    equally spaced points generated in the first and second
%    directions.
%    NSTEP1 and NSTEP2 should be at least 1.
%
%    Input, real X1(NDIM), X2(NDIM), X3(NDIM), the points
%    which define three corners of the parallelogram on
%    which the grid will be generated.
%
%    Output, real X(NDIM), the point whose parallelogram
%    coordinates are (I,J).
%
  if ( nstep1 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4N - Fatal error!\n' );
    fprintf ( 1, '  NSTEP1 <= 1.\n' );
    fprintf ( 1, '  NSTEP1 = %d\n', nstep1 );
    error ( 'GRID4N - Fatal error!' );
  end

  if ( nstep2 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4N - Fatal error!\n' );
    fprintf ( 1, '  NSTEP2 <= 1.\n' );
    fprintf ( 1, '  NSTEP2 = %d\n', nstep2 );
    error ( 'GRID4N - Fatal error!' );
  end

  if ( i1 == i2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4N - Fatal error!\n' );
    fprintf ( 1, '  I1 = I2\n' );
    fprintf ( 1, '  I1 = %d\n', i1 );
    fprintf ( 1, '  I2 = %d\n', i2 );
    error ( 'GRID4N - Fatal error!' );
  end

  if ( j1 == j2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4N - Fatal error!\n' );
    fprintf ( 1, '  J1 = J2\n' );
    fprintf ( 1, '  J1 = %d\n', j1 );
    fprintf ( 1, '  J2 = %d\n', j2 );
    error ( 'GRID4N - Fatal error!' );
  end

  psi2 = ( i - i1 ) / ( i2 - i1 );

  psi3 = ( j - j1 ) / ( j2 - j1 );

  psi1 = 1.0 - psi2 - psi3;

  x(1:ndim) = psi1 * x1(1:ndim) + psi2 * x2(1:ndim) + psi3 * x3(1:ndim);

  return
end
