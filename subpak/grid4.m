function x = grid4 ( i1, i2, j1, j2, ndim, nstep1, nstep2, x1, x2, x3 )

%*****************************************************************************80
%
%% GRID4 computes a grid on the parallelogram set by X1, X2 and X3 in N space.
%
%  Discussion:
%
%    Unlike GRID3, GRID4 does not necessarily place X1 at the
%    "origin" of the parallelogram, with X2 and X3 set at the
%    extreme I and J coordinates.  Instead, the user is free
%    to specify the I and J coordinates of the points, although
%    they are required to lie on a subparallelogram of the
%    larger one.
%
%    The line through X1 and X2 will have NSTEP1
%    points generated along it, and the line through X1 and
%    X3 will have NSTEP2 points generated along it.
%
%    If we imagine that the
%    main parallelogram is drawn first, with coordinate
%    ranges 1 <= I <= NSTEP1 and 1 <= J <= NSTEP2, then
%    these indices determine the (I,J) coordinates of the
%    three points, namely:
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
%    Assuming that the indices I1, I2, J1 and J2 are "within
%    bounds", the following special values will be computed:
%
%      X(*,I1,J1) = X1
%      X(*,I2,J1) = X2
%      X(*,I1,J2) = X3.
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
%    Input, integer I1, I2, J1, J2, the indices.
%
%    Input, integer NDIM, the dimension of the points X1, X2 and X3.
%
%    Input, integer NSTEP1, NSTEP2.  These are the number of
%    equally spaced points to generate in the first and second
%    directions.  NSTEP1 and NSTEP2 should be at least 1.
%
%    Input, real X1(NDIM), X2(NDIM), X3(NDIM), the points
%    which define three corners of the parallelogram on
%    which the grid will be generated.
%
%    Output, real X(NDIM,NSTEP1,NSTEP2), the set of equally
%    spaced points.  Fixing the second and third indices
%    of X represents one point.
%
  if ( nstep1 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4 - Fatal error!\n' );
    fprintf ( 1, '  NSTEP1 <= 1.\n' );
    fprintf ( 1, '  NSTEP1 = %d\n', nstep1 );
    error ( 'GRID4 - Fatal error!' );
  end

  if ( nstep2 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4 - Fatal error!\n' );
    fprintf ( 1, '  NSTEP2 <= 1.\n' );
    fprintf ( 1, '  NSTEP2 = %d\n', nstep2 );
    error ( 'GRID4 - Fatal error!' );
  end

  if ( i1 == i2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4 - Fatal error!\n' );
    fprintf ( 1, '  I1 = I2\n' );
    fprintf ( 1, '  I1 = %d\n', i1 );
    fprintf ( 1, '  I2 = %d\n', i2 );
    error ( 'GRID4 - Fatal error!' );
  end

  if ( j1 == j2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID4 - Fatal error!\n' );
    fprintf ( 1, '  J1 = J2\n' );
    fprintf ( 1, '  J1 = %d\n', j1 );
    fprintf ( 1, '  J2 = %d\n', j2 );
    error ( 'GRID4 - Fatal error!' );
  end

  for i = 1 : nstep1
    for j = 1 : nstep2

      psi2 = ( i - i1 ) / ( i2 - i1 );

      psi3 = ( j - j1 ) / ( j2 - j1 );

      psi1 = 1.0 - psi2 - psi3;

      x(1:ndim,i,j) = psi1 * x1(1:ndim) + psi2 * x2(1:ndim) + psi3 * x3(1:ndim);

    end
  end

  return
end
