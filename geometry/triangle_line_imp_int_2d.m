function [ nin, pi ] = triangle_line_imp_int_2d ( a, b, c, t, nin, pi )

%*****************************************************************************80
%
%% TRIANGLE_LINE_IMP_INT_2D finds where an implicit line intersects a triangle in 2D.
%
%  Discussion:
%
%    An implicit line is the set of points ( X, Y ) satisfying
%
%      A * X + B * Y + C = 0
%
%    where at least one of A and B is not zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, determine the equation of the line:
%    A*X + B*Y + C = 0.
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, integer NIN, the number of points of intersection
%    of the line with the triangle.  NIN may be 0, 1, 2 or 3.
%
%    Output, real PI(2,3), contains the intersection points.
%
  dim_num = 2;

  nin = 0;

  for i = 1 : 3

    j = i4_wrap ( i+1, 1, 3 );
%
%  Get the implicit form of the line through vertices I and I+1.
%
    [ a1, b1, c1 ] = line_exp2imp_2d ( t(1:2,i), t(1:2,j) );
%
%  Seek an intersection with the original line.
%
    [ ival, p ] = lines_imp_int_2d ( a, b, c, a1, b1, c1 );
%
%  If there is an intersection, determine if it lies between the two vertices.
%
    if ( ival == 1 )

      test1 = ( p(1:dim_num)'  - t(1:dim_num,i) )' ...
        * ( t(1:dim_num,j) - t(1:dim_num,i) );
      test2 = ( t(1:dim_num,j) - t(1:dim_num,i) )' ...
        * ( t(1:dim_num,j) - t(1:dim_num,i) );

      if ( 0 <= test1 & test1 <= test2 )
        nin = nin + 1;
        pi(1:dim_num,nin) = p(1:dim_num)';
      end

    end

  end

  return
end
