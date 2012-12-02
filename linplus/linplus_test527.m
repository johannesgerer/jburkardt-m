function linplus_test527 ( )

%*****************************************************************************80
%
%% TEST527 tests R8PP_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST527\n' );
  fprintf ( 1, '  R8PP_INDICATOR sets up a R8PP indicator matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  a = r8pp_indicator ( n );

  r8pp_print ( n, a, '  The R8PP indicator matrix:' );
 
  return
end
