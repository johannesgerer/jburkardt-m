function x = grid1n ( i, ndim, nstep, x1, x2 )

%*****************************************************************************80
%
%% GRID1N finds the I-th grid point between X1 and X2 in N dimensions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number of the desired point.
%    Normally I would be between 1 and NSTEP, but that is
%    not necessary.  Note that I = 1 returns X1 and I = NSTEP
%    returns X2.
%
%    Input, integer NDIM, the dimension of the points X, X1 and X2.
%
%    Input, integer NSTEP, this is the number of equally
%    spaced points that are between X1 and X2.  NSTEP must
%    be at least 2, because X1 and X2 are always included
%    in the set of points.
%
%    Input, real X1(NDIM), X2(NDIM), the first and last
%    points, between which the equally spaced points lie.
%
%    Output, real X(NDIM), the I-th grid point between X1 and X2.
%
  if ( nstep <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID1N - Fatal error!\n' );
    fprintf ( 1, '  NSTEP <= 1.\n' );
    fprintf ( 1, '  NSTEP = %d\n', nstep );
    error ( 'GRID1N - Fatal error!' );
  end

  x(1:ndim) = ( ( nstep - i     ) * x1(1:ndim) ...
              + (         i - 1 ) * x2(1:ndim) ) ...
              / ( nstep     - 1 );

  return
end
