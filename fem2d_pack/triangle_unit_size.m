function value = triangle_unit_size ( rule )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_SIZE returns the "size" of a unit triangle quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%     1, NORDER =  1, precision 1, Zienkiewicz #1.
%     2, NORDER =  2, precision 1, the "vertex rule".
%     3, NORDER =  3, precision 2, Strang and Fix formula #1.
%     4, NORDER =  3, precision 2, Strang and Fix formula #2, Zienkiewicz #2.
%     5, NORDER =  4, precision 3, Strang and Fix formula #3, Zienkiewicz #3.
%     6, NORDER =  6, precision 3, Strang and Fix formula #4.
%     7, NORDER =  6, precision 3, Stroud formula T2:3-1.
%     8, NORDER =  6, precision 4, Strang and Fix formula #5.
%     9, NORDER =  7, precision 4, Strang and Fix formula #6.
%    10, NORDER =  7, precision 5, Strang and Fix formula #7,
%        Stroud formula T2:5-1, Zienkiewicz #4, Schwarz Table 2.2.
%    11, NORDER =  9, precision 6, Strang and Fix formula #8.
%    12, NORDER = 12, precision 6, Strang and Fix formula #9.
%    13, NORDER = 13, precision 7, Strang and Fix formula #10.
%    14, NORDER =  7, precision ?.
%    15, NORDER = 16, precision 7, conical product Gauss, Stroud formula T2:7-1.
%    16, NORDER = 64, precision 15, triangular product Gauss rule.
%    17, NORDER = 19, precision 8, from CUBTRI, ACM TOMS #584.
%    18, NORDER = 19, precision 9, from TRIEX, Lyness and Jespersen.
%    19, NORDER = 28, precision 11, from TRIEX, Lyness and Jespersen.
%    20, NORDER = 37, precision 13, from ACM TOMS #706.
%
%    Output, integer TRIANGLE_UNIT_SIZE, the order of the rule.
%
  if ( rule == 1 )
    value = 1;
  elseif ( rule == 2 )
    value = 3;
  elseif ( rule == 3 )
    value = 3;
  elseif ( rule == 4 )
    value = 3;
  elseif ( rule == 5 )
    value = 4;
  elseif ( rule == 6 )
    value = 6;
  elseif ( rule == 7 )
    value = 6;
  elseif ( rule == 8 )
    value = 6;
  elseif ( rule == 9 )
    value = 7;
  elseif ( rule == 10 )
    value = 7;
  elseif ( rule == 11 )
    value = 9;
  elseif ( rule == 12 )
    value = 12;
  elseif ( rule == 13 )
    value = 13;
  elseif ( rule == 14 )
    value = 7;
  elseif ( rule == 15 )
    value = 16;
  elseif ( rule == 16 )
    value = 64;
  elseif ( rule == 17 )
    value = 19;
  elseif ( rule == 18 )
    value = 19;
  elseif ( rule == 19 )
    value = 28;
  elseif ( rule == 20 )
    value = 37;
  else
    value = -1;
  end

  return
end
