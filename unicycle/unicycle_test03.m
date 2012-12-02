function unicycle_test03 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST03 tests UNICYCLE_INVERSE;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 June 2012.
%
%  Author:
%
%    John Burkardt
%
  n = 7;
  u = [ 1, 7, 6, 2, 4, 3, 5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST03\n' );
  fprintf ( 1, '  UNICYCLE_INVERSE inverts a unicycle\n' );

  unicycle_print ( n, u, '  The original unicycle:' );
 
  u_inverse = unicycle_inverse ( n, u );

  unicycle_print ( n, u_inverse, '  The inverse unicycle:' );
 
  return
end
