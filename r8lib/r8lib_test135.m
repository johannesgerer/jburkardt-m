function r8lib_test135 ()

%*****************************************************************************80
%
%% TEST135 tests R8VEC_REVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST135\n' );
  fprintf ( 1, '  R8VEC_REVERSE reverses a DVEC.\n' );
 
  a = r8vec_indicator ( n );
 
  r8vec_print ( n, a, '  Original array:' );

  a = r8vec_reverse ( n, a );

  r8vec_print ( n, a, '  Reversed array:' );
 
  return
end
