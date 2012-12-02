function test001 ( )

%*****************************************************************************80
%
%% TEST001 tests ANGLE_CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  For the ANGLE PDF:\n' );
  fprintf ( 1, '  ANGLE_CDF evaluates the CDF;\n' );

  n = 5;
  x = 0.50;

  cdf = angle_cdf ( x, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter N = %6d\n', n );
  fprintf ( 1, '  PDF argument X =  %14f\n', x );
  fprintf ( 1, '  CDF value =       %14f\n', cdf );

  return
end
