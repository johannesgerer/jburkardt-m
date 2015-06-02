function circle_segment_test02 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST02 tabulates quadrature rules with GQCIRCSEGM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST02\n' );
  fprintf ( 1, '  GQCIRCSEGM computes a Gauss quadrature rule for a\n' );
  fprintf ( 1, '  circle segment with circle of radius R and center (0,0),\n' );
  fprintf ( 1, '  with segment angles in [-theta/2,+theta/2].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tabulate some rules.\n' );

  r = 1.0;

  theta = 2.0 * pi;
  for a = 0 : 3
    for n = 0 : 5
      thetah = theta / 2.0;
      [ x, y, w ] = gqcircsegm ( n, thetah, r );
      n1 = length ( x );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Rule of precision %d\n', n );
      fprintf ( 1, '  THETA = %g\n', theta );
      fprintf ( 1, '  Grid order: %d\n', n1 );
      fprintf ( 1, '  Sum(W) = %g\n', sum ( w(:) ) );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  X  Y  W\n' );
      fprintf ( 1, '\n' );
      for i = 1 : n1
        fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', x(i), y(i), w(i) );
      end
    end
    theta = theta / 2.0;
  end
 
  return
end
