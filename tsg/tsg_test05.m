function tsg_test05 ( )

%*****************************************************************************80
%
%% TSG_TEST05 interpolates with an adaptive hierarchical locally quadratic basis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2014
%
%  Author:
%
%    Miro Stoyanov
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TSG_TEST05\n' );
  fprintf ( 1, '  Interpolate the function f(x,y) = exp( -x^2 ) * cos( y )\n' );
  fprintf ( 1, '  using an adaptive hierarchical locally quadratic polynomial basis.\n' );

  name = 'tsgExample5';
  dim = 2;
  outs = 1;
  rule = 'local-polynomial';
  prec = 4;
  order = 2;
  growth = 'level';

  [ lGrid, newp ] = tsgMakeGrid ( name, dim, outs, rule, prec, order, growth );
%
%  Iterate until the refinement code sees no need to add more points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Iteration  Samples     Value    Error\n' );
  fprintf ( 1, '\n' );

  itr = 0;

  while ( 0 < size ( newp, 1 ) )
%
%  Rescaled the points from the default [-1,+1]^2 to [0,1]^2.
%
    norm_points = 0.5 * newp + 0.5;
%
%  Evaluate the function at the grid points.
%
    vals = exp ( -norm_points(:,1).^2 ) .* cos( norm_points(:,2) );
%
%  Make the function values available to the other routines.
%
    tsgLoadValues( lGrid, vals );
%
%  Evaluate the interpolant at (0.3,0.7).
%  Here, we have to map the evaluation point from [0,1]^2 back to [-1,+1]^2.
%
    res = tsgEvaluate ( lGrid, 2*[ 0.3, 0.7 ] - [ 1, 1 ] );
%
%  Retrieve the points used in the grid, simply so we can count them.
%
    points = tsgGetPoints( lGrid );
    point_num = size ( points, 1 );
%
%  Print statistics for this iteration.
%
    err = abs ( res - exp ( -0.3^2) * cos ( 0.7 ) );
    fprintf ( 1, '  %9d  %7d  %g  %g\n', itr, point_num, res, err );
%
%  See if the grid needs to be refined.
%
    newp = tsgRefineGrid ( lGrid, 0.000001, 'classic' );

    itr = itr + 1;
    
  end
%
%  Delete the work files associated with the grid.
%
  tsgDeleteGrid ( lGrid );

  return
end
