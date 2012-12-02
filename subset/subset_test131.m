function subset_test131 ( )

%*****************************************************************************80
%
%% TEST131 tests R8POLY_F2P, R8POLY_P2F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  a = r8vec_indicator ( n );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST131\n' );
  fprintf ( 1, '  R8POLY_P2F: power sum => factorial;\n' );
  fprintf ( 1, '  R8POLY_F2P: factorial => power sum.\n' );

  r8poly_print ( n-1, a, '  The power sum polynomial:' );
 
  b = r8poly_p2f ( n, a );
 
  r8vec_print ( n, b, '  The factorial polynomial coefficients:' );
 
  c = r8poly_f2p ( n, a );
 
  r8poly_print ( n-1, c, '  The recovered power sum polynomial:' );

  return
end
