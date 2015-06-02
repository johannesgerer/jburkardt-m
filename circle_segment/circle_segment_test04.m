function circle_segment_test04 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST04 approximates integrals with GQCIRCSEGM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST04\n' );
  fprintf ( 1, '  GQCIRCSEGM computes a Gauss quadrature rule for a\n' );
  fprintf ( 1, '  circle segment with circle of radius R and center (0,0),\n' );
  fprintf ( 1, '  with segment angles in [-theta/2,+theta/2].\n' )
  fprintf ( 1, '\n' );
  theta = pi / 4.0;
  thetah = theta / 2.0;
  r = 1.0;
  fprintf ( 1, '  Radius R = %g\n', r );
  fprintf ( 1, '  Angle Theta = %g\n', theta );
  fprintf ( 1, '  Estimate the integral of (x+y+2)^k using precision P rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   P:       1               3               5' );
  fprintf ( 1, '               7               9              11\n' );
  fprintf ( 1, '   K\n' );

  for k = 0 : 11
    fprintf ( 1, '  %2d', k );
    for p = 1 : 2 : 11
      xyw = gqcircsegm ( p, thetah, r );
      f = ( xyw(:,1) + xyw(:,2) + 2 ) .^ k;
      q = xyw(:,3)' * f(:);
      fprintf ( 1, '  %12f.5', q );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
