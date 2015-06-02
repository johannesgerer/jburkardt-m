function tsg_test01 ( )

%*****************************************************************************80
%
%% TSG_TEST01 estimates an integral in 2D using a Clenshaw-Curtis sparse grid.
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
  fprintf ( 1, 'TSG_TEST01\n' );
  fprintf ( 1, '  Estimate an integral in 2D using a Clenshaw-Curtis sparse grid.\n' );
%
%  Get the points and weights of the rule.
%  the "order" input argument is not needed for this particular case.
%
  dim = 2;
  rule = 'clenshaw-curtis';
  level = 7;
  order = 0;
  growth = 'level';

  [ weights, points ] = tsgMakeQuadrature ( dim, rule, level, order, growth );

  point_num = size ( points, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid uses %d points.\n', point_num );
%
%  Evaluate the integrand at the points, multiply by the weights, and sum:
%
  I = weights' * ( exp( -points(:,1).^2 ) .* cos( points(:,2) ) );
  fprintf ( 1, '  The integral estimate is %g\n', I );
%
%  Estimate the integral using MATLAB's quad() function.
%
  E = quad ( @(x)( exp( -x.^2 ) ), -1, 1, 1.E-14 ) ...
    * quad ( @(x)( cos(x)       ), -1, 1, 1.E-14 );

  err = abs ( I - E );

  fprintf ( 1, '  The estimated integral error is %g\n', err );

  return
end
