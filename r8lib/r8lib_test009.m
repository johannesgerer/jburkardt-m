function r8lib_test009 ( )

%*****************************************************************************80
%
%% TEST009 tests R8_HUGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST009\n' );
  fprintf ( 1, '  R8_HUGE returns the largest R8 value;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    R8_HUGE = %f\n', r8_huge ( ) );

  return
end
