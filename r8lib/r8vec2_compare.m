function isgn = r8vec2_compare ( n, a1, a2, i, j )

%*****************************************************************************80
%
%% R8VEC2_COMPARE compares two entries in an R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is a dataset consisting of N pairs of real values, stored
%    as two separate vectors A1 and A2.
%
%    The lexicographic ordering is used.
%
%  Example:
%
%    A1(I) A2(I)   A1(J) A2(J)  ISGN
%    -----------   -----------  ----
%    1.0   5.0  <  1.0   6.0     -1
%    1.0   5.0  <  2.0   8.0     -1
%    1.0   5.0  <  9.0   1.0     -1
%    1.0   5.0  =  1.0   5.0      0
%    1.0   5.0  >  0.0   2.0     +1
%    1.0   5.0  >  0.0   5.0     +1
%    1.0   5.0  >  1.0   3.0     +1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data items.
%
%    Input, real A1(N), A2(N), the two components of each item.
%
%    Input, integer I, J, the items to be compared.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, item I < item J,
%     0, item I = item J,
%    +1, item I > item J.
%
  isgn = 0;

       if ( a1(i) < a1(j) )

    isgn = -1;

  elseif ( a1(i) == a1(j) )

        if ( a2(i) < a2(j) )
      isgn = -1;
    elseif ( a2(i) < a2(j) )
      isgn = 0;
    elseif ( a2(j) < a2(i) )
      isgn = +1;
    end

  elseif ( a1(j) < a1(i) )

    isgn = +1;

  end

  return
end
