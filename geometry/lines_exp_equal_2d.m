function value = lines_exp_equal_2d ( p1, p2, q1, q2 )

%*****************************************************************************80
%
%% LINES_EXP_EQUAL_2D determines if two explicit lines are equal in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      the line through the points P1 and P2.
%
%    It is essentially impossible to accurately determine whether two
%    explicit lines are equal in 2D.  However, for form's sake, and
%    because occasionally the correct result can be determined, we
%    provide this routine.  Since divisions are avoided, if the
%    input data is exactly representable, the result should be
%    correct.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), two points on the first line.
%
%    Input, real Q1(2,1), Q2(2,1), two points on the second line.
%
%    Output, logical VALUE, is TRUE if the two lines are
%    determined to be identical.
%

%
%  Slope (P1,P2) = Slope (P2,Q1).
%
  test1 = ( p2(2,1) - p1(2,1) ) * ( q1(1,1) - p2(1,1) ) ...
        - ( p2(1,1) - p1(1,1) ) * ( q1(2,1) - p2(2,1) );

  if ( test1 ~= 0.0 )
    value = 0;
    return
  end
%
%  Slope (Q1,Q2) = Slope (P2,Q1).
%
  test2 = ( q2(2,1) - q1(2,1) ) * ( q1(1,1) - p2(1,1) ) ...
        - ( q2(1,1) - q1(1,1) ) * ( q1(2,1) - p2(2,1) );

  if ( test2 ~= 0.0 )
    value = 0;
    return
  end
%
%  Slope (P1,P2) = Slope (P1,Q2).
%
  test3 = ( p2(2,1) - p1(2,1) ) * ( q2(1,1) - p1(1,1) ) ...
        - ( p2(1,1) - p1(1,1) ) * ( q2(2,1) - p1(2,1) );

  if ( test3 ~= 0.0 )
    value = 0;
    return
  end
%
%  Slope (Q1,Q2) = Slope (P1,Q2).
%
  test4 = ( q2(2,1) - q1(2,1) ) * ( q2(1,1) - p1(1,1) ) ...
        - ( q2(1,1) - q1(1,1) ) * ( q2(2,1) - p1(2,1) );

  if ( test4 ~= 0.0 )
    value = 0;
    return
  end

  value = 1;

  return
end
