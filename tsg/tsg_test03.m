function tsg_test03 ( )

%*****************************************************************************80
%
%% TSG_TEST03 uses a Gauss-Legendre sparse grid to integrate a function in 2D.
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
  fprintf ( 1, 'TSG_TEST03\n' );
  fprintf ( 1, '  Integrate a function in 2D using a Gauss-Legendre sparse grid.\n' );
%
%  Get the points and weights of the rule.
%
  dim = 2;
  rule = 'gauss-legendre';
  prec = 10;
  order = 0;
  growth = 'basis';

  [ weights, points ] = tsgMakeQuadrature ( dim, rule, prec, order, growth );

  point_num = size ( points, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid uses %d points.\n', point_num );
%
%  Estimate the integral by evaluating the function at the grid points and
%  multiplying by the weights.
%
  I = weights' * ( exp( -points(:,1).^2 ) .* cos( points(:,2) ) );
  fprintf ( 1, '  The integral estimate is %g\n', I )
%
%  Estimate the integral using MATLAB's quad() function.
%
  E = quad( @(x)( exp( -x.^2 ) ), -1, 1, 1.E-14 ) ...
    * quad( @(x)( cos(x) ), -1, 1, 1.E-14 );

  err = abs ( I - E );

  fprintf ( 1, '  The estimated integral error is %g\n', err );

  return
end
