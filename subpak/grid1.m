function x = grid1 ( ndim, nstep, x1, x2 )

%*****************************************************************************80
%
%% GRID1 finds grid points between X1 and X2 in N dimensions.
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
%    Input, integer NDIM, the dimension of the points X1 and X2.
%
%    Input, integer NSTEP, the number of points to be generated.
%    NSTEP must be at least 2.
%
%    Input, real X1(NDIM), X2(NDIM), the first and last
%    points, between which the equally spaced points are
%    to be computed.
%
%    Output, real X(NDIM,NSTEP), the set of equally spaced
%    points.  Each column of X represents one point, with X(*,1) = X1
%    and X(*,NSTEP) = X2.
%
  if ( nstep <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID1 - Fatal error!\n' );
    fprintf ( 1, '  NSTEP <= 1.\n' );
    fprintf ( 1, '  NSTEP = %d\n', nstep );
    error ( 'GRID1 - Fatal error!' );
  end

  for i = 1 : nstep
    x(1:ndim,i) = ...
      ( ( nstep - i     ) * x1(1:ndim)'   ...
      + (         i - 1 ) * x2(1:ndim)' ) ...
      / ( nstep     - 1 );
  end

  return
end
