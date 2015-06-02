function i4mat_indicator_test ( )

%*****************************************************************************80
%
%% I4MAT_INDICATOR_TEST tests I4MAT_INDICATOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4MAT_INDICATOR_TEST\n' );
  fprintf ( 1, '  I4MAT_INDICATOR returns an indicator matrix;\n' );
 
  a = i4mat_indicator ( m, n );
 
  i4mat_print ( m, n, a, '  Indicator matrix:' );
 
  return
end
