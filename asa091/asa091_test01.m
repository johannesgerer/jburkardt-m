function asa091_test01 ( )

%*****************************************************************************80
%
%% TEST01 makes a single simple calculation with PPCHI2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  value_correct = 0.4;
  p = 0.017523;
  v = 4.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  Perform a simple sample calculation using\n' );
  fprintf ( 1, '  PPCHI2 to invert the Chi-Squared CDF.\n' );

  [ g, ifault ] = alngam ( v / 2.0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P =                  %f\n', p );
  fprintf ( 1, '  V =                  %f\n', v );
  fprintf ( 1, '  G Log(Gamma(V/2)) =  %f\n', g );

  [ value, ifault ] = ppchi2 ( p, v, g );

  fprintf ( 1, '  VALUE =              %f\n', value );
  fprintf ( 1, '  VALUE (correct) =    %f\n', value_correct );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Error flag IFAULT = %d\n', ifault );

  return
end
