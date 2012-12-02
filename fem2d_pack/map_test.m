function map_test ( code )

%*****************************************************************************80
%
%% MAP_TEST tests the map routines.
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
%  Parameters:
%
%    Input, character CODE(*), the code for the element.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T4', 'T6' and 'T10'.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MAP_TEST: The interpolation matrix for element "%s"\n', code );
  fprintf ( 1, '\n' );

  element_order = order_code ( code );

  w = map ( code, element_order );

  r8mat_print ( element_order, element_order, w, '  The interpolation matrix' );

  return
end
