function tsg_test04 ( )

%*****************************************************************************80
%
%% TSG_TEST04 uses an anisotropic Gauss-Gegenbauer sparse grid for integration.
%
%  Discussion:
%
%    The sparse grid will use about 8 times as many points in the Y direction
%    as in the X direction.
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
  fprintf ( 1, 'TSG_TEST04\n' );
  fprintf ( 1, '  Generate an anisotropic sparse grid, based on the\n' );
  fprintf ( 1, '  Gauss-Gegenbauer rule, using about 8 times as many points\n' );
  fprintf ( 1, '  in the Y direction as in the X direction;\n' );
  fprintf ( 1, '  Use this grid to estimate an integral.\n' );
%
%  Get the points and weights of the sparse grid.
%
  dim = 2;
  rule = 'gauss-gegenbauer';
  prec = 16;
  order = 0;
  growth = 'level';

  [ weights, points ] = tsgMakeQuadrature ( dim, rule, prec, order, growth, ...
    [ 8, 1 ]', [ 0.4, 0.0 ] );

  point_num = size ( points, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid uses %d points.\n', point_num );
%
%  Estimate the integral by evaluating the function at the grid points and
%  multiplying by the weights.
%
  I = weights' * ( ( points(:,1) - 2 ).^3 .* exp( -points(:,2).^2 ) );
  fprintf ( 1, '  The integral estimate is %g\n', I );
%
%  Estimate the integral using MATLAB's quad() function.
%
  E = quad( @(x)( (x - 2).^3 .* (1 - x.^2).^0.4 ), -1, 1, 1.E-14 ) ...
    * quad( @(x)( exp( -x.^2 ) .* ( 1 - x.^2 ).^0.4 ), -1, 1, 1.E-14 );

  err = abs ( I - E );

  fprintf ( 1, '  The estimated integral error is %g\n', err );

  return
end
