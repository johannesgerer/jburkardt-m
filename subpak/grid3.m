function x = grid3 ( ndim, nstep1, nstep2, x1, x2, x3 )

%*****************************************************************************80
%
%% GRID3 computes a grid on the parallelogram set by X1, X2 and X3 in N space.
%
%  Discussion:
%
%    The line between X1 and X2 will have NSTEP1 points generated along 
%    it, and the line between X1 and X3 will have NSTEP2 points generated
%    along it.
%
%    Fixing the second and third indices of X represents one point, with
%    the following special values:
%
%      X(*,1,1)      = X1
%      X(*,NSTEP1,1) = X2
%      X(*,1,NSTEP2) = X3.
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
%    Input, integer NDIM, the dimension of the points X1, X2 and X3.
%
%    Input, integer NSTEP1, NSTEP2.  These are the number of
%    equally spaced points to generate in the first and second
%    directions.  NSTEP1 and NSTEP2 must be at least 2, because X1, X2 and
%    X3 are always included in the set of points.
%
%    Input, real X1(NDIM), X2(NDIM), X3(NDIM), the points
%    which define three corners of the parallelogram on
%    which the grid will be generated.
%
%    Output, real X(NDIM,NSTEP1,NSTEP2), the set of equally
%    spaced points.  
%
  if ( nstep1 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID3 - Fatal error!\n' );
    fprintf ( 1, '  NSTEP1 <= 1.\n' );
    fprintf ( 1, '  NSTEP1 = %d\n', nstep1 );
    error ( 'GRID3 - Fatal error!' );
  end

  if ( nstep2 <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID3 - Fatal error!\n' );
    fprintf ( 1, '  NSTEP2 <= 1.\n' );
    fprintf ( 1, '  NSTEP2 = %d\n', nstep2 );
    error ( 'GRID3 - Fatal error!' );
  end

  for i = 1 : nstep1
    for j = 1 : nstep2

      psi2 = ( i - 1 ) / ( nstep1 - 1 );
      psi3 = ( j - 1 ) / ( nstep2 - 1 );
      psi1 = 1.0 - psi2 - psi3;

      x(1:ndim,i,j) = psi1 * x1(1:ndim) + psi2 * x2(1:ndim) + psi3 * x3(1:ndim);

    end
  end

  return
end
