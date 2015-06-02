function tsg_test02 ( )

%*****************************************************************************80
%
%% TSG_TEST02 interpolates a function in 2D using a Clenshaw-Curtis sparse grid.
%
%  Discussion:
%
%    The sparse grid that is used should exactly interpolate any polynomial
%    of total degree 10 or less.
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
  fprintf ( 1, 'TSG_TEST02\n' );
  fprintf ( 1, '  Interpolate a function in 2D using a Clenshaw-Curtis sparse grid.\n' );

  name = 'tsgExample2';
  dim = 2;
  outs = 1;
  rule = 'clenshaw-curtis';
  prec = 10;
  order = 0;
  growth = 'basis';

  [ lGrid, points ] = tsgMakeGrid ( name, dim, outs, rule, prec, order, growth );

  point_num = size ( points, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid uses %d points.\n', point_num );
%
%  Evaluate the function at the grid points.
%
  vals = ( exp( -points(:,1).^2 ) .* cos( points(:,2) ) );
%
%  Load the grid and function values so they are accessible for the computation.
%
  tsgLoadValues( lGrid, vals );
%
%  Evaluate the interpolant at a point.
%
  [ res ] = tsgEvaluate( lGrid, [ 0.3, 0.7 ] );
  fprintf ( 1, '  Interpolant evaluated at (0.3,0.7) = %g\n', res );
  exact = exp ( -0.3^2 ) * cos ( 0.7 );
  err = abs ( res - exact );
  fprintf ( 1, '  Interpolant error at (0.3,0.7) = %g\n', err );
%
%  Integrate the sparse grid interpolant to get an estimate of the integral of the
%  function.
%
  I = tsgIntegrate ( lGrid );
  fprintf ( 1, '  The integral estimate is %g\n', I );
%
%  Estimate the integral using MATLAB's quad() function.
%
  E = quad ( @(x) ( exp( -x.^2 ) ), -1, 1, 1.E-14 ) ...
    * quad ( @(x) ( cos(x)       ), -1, 1, 1.E-14 );

  err = abs ( E - I );

  fprintf ( 1, '  The estimated integral error is %g\n', err );
%
%  Clear out the temporary work files associated with the "lGrid" calculation.
%
  tsgDeleteGrid ( lGrid );

  return
end
