function order = order_code ( code )

%*****************************************************************************80
%
%% ORDER_CODE returns the order for each element.
%
%  List:
%
%    CODE  Order  Definition
%    ----  -----  ----------
%    Q4     4     4 node linear Lagrange/serendipity quadrilateral;
%    Q8     8     8 node quadratic serendipity quadrilateral;
%    Q9     9     9 node quadratic Lagrange quadrilateral;
%    Q12   12     12 node cubic serendipity quadrilateral;
%    Q16   16     16 node cubic Lagrange quadrilateral;
%    QL     6     6 node linear/quadratic quadrilateral;
%    T3     3     3 node linear triangle;
%    T6     6     6 node quadratic triangle;
%    T10   10     10 node cubic triangle.
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
%    Input, string CODE, the code for the element.
%
%    Output, integer ORDER, the order of the element.
%
  if ( s_eqi ( code, 'Q4' ) )
    order = 4;
  elseif ( s_eqi ( code, 'Q8' ) )
    order = 8;
  elseif ( s_eqi ( code, 'Q9' ) )
    order = 9;
  elseif ( s_eqi ( code, 'Q12' ) )
    order = 12;
  elseif ( s_eqi ( code, 'Q16' ) )
    order = 16;
  elseif ( s_eqi ( code, 'QL' ) )
    order = 6;
  elseif ( s_eqi ( code, 'T3' ) )
    order = 3;
  elseif ( s_eqi ( code, 'T6' ) )
    order = 6;
  elseif ( s_eqi ( code, 'T10' ) )
    order = 10;
  else
    order = -1;
  end

  return
end
