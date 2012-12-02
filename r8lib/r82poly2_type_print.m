function r82poly2_type_print ( type )

%*****************************************************************************80
%
%% R82POLY2_TYPE_PRINT prints the meaning of the output from R82POLY2_TYPE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TYPE, the type index returned by R82POLY2_TYPE.
%
  if ( type == 1 )
    fprintf ( 1, '  The set of solutions forms a hyperbola.\n' );
  elseif ( type == 2 )
    fprintf ( 1, '  The set of solutions forms a parabola.\n' );
  elseif ( type == 3 )
    fprintf ( 1, '  The set of solutions forms an ellipse.\n' );
  elseif ( type == 4 )
    fprintf ( 1, '  The set of solutions forms an imaginary ellipse.\n' );
    fprintf ( 1, '  (There are no real solutions).\n' );
  elseif ( type == 5 )
    fprintf ( 1, '  The set of solutions forms a pair of intersecting lines.\n' );
  elseif ( type == 6 )
    fprintf ( 1, '  The set of solutions is a single point.\n' );
  elseif ( type == 7 )
    fprintf ( 1, '  The set of solutions form a pair of distinct parallel lines.\n' );
  elseif ( type == 8 )
    fprintf ( 1, '  The set of solutions forms a pair of imaginary parallel lines.\n' );
    fprintf ( 1, '  (There are no real solutions).\n' );
  elseif ( type == 9 )
    fprintf ( 1, '  The set of solutions forms a pair of coincident lines.\n' );
  elseif ( type == 10 )
    fprintf ( 1, '  The set of solutions forms a single line.\n' );
  elseif ( type == 11 )
    fprintf ( 1, '  The set of solutions is all space.\n' );
  elseif ( type == 12 )
    fprintf ( 1, '  The set of solutions is empty.\n' );
  else
    fprintf ( 1, '  This type index is unknown.\n' );
  end

  return
end
