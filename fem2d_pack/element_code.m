function code = element_code ( i )

%*****************************************************************************80
%
%% ELEMENT_CODE returns the code for each element.
%
%  List:
%
%    I  ELEMENT_CODE   Definition
%    -  ------------   ----------
%    1  Q4             4 node linear Lagrange/serendipity quadrilateral;
%    2  Q8             8 node quadratic serendipity quadrilateral;
%    3  Q9             9 node quadratic Lagrange quadrilateral;
%    4  Q12            12 node cubic serendipity quadrilateral;
%    5  Q16            16 node cubic Lagrange quadrilateral;
%    6  QL             6 node linear/quadratic quadrilateral;
%    7  T3             3 node linear triangle;
%    8  T6             6 node quadratic triangle;
%    9  T10            10 node cubic triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number of the element.
%
%    Output, string CODE, the code for the element.
%
  if ( i == 1 )
    code = 'Q4';
  elseif ( i == 2 )
    code = 'Q8';
  elseif ( i == 3 )
    code = 'Q9';
  elseif ( i == 4 )
    code = 'Q12';
  elseif ( i == 5 )
    code = 'Q16';
  elseif ( i == 6 )
    code = 'QL';
  elseif ( i == 7 )
    code = 'T3';
  elseif ( i == 8 )
    code = 'T6';
  elseif ( i == 9 )
    code = 'T10';
  else
    code = '????';
  end

  return
end
