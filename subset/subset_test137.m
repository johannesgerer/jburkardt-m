function subset_test137 ( )

%*****************************************************************************80
%
%% TEST137 tests R8POLY_POWER.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST137\n' );
  fprintf ( 1, '  R8POLY_POWER takes a polynomial to a power.\n' );
%
%  Cube (2-X).  Answer is 8-12*X+6*X**2-X**3.
%
  na = 1;
  a(1:na+1) = [ 2.0, -1.0 ];
  p = 3;

  r8poly_print ( na, a, '  The polynomial A:' );
 
  b = r8poly_power ( na, a, p );
 
  r8poly_print ( p*na, b, '  Raised to the power 3:' );
%
%  Square X+X**2
%
  na = 2;
  a(1:na+1) = [ 0.0, 1.0, 1.0 ];
  p = 2;

  r8poly_print ( na, a, '  The polynomial A:' );
 
  b = r8poly_power ( na, a, p );
 
  r8poly_print ( p*na, b, '  Raised to the power 2:' );

  return
end
