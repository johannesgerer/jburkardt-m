function [ v, vmax, done ] = regro_next ( n, v, vmax, done )

%*****************************************************************************80
%
%% REGRO_NEXT computes restricted growth functions one at a time.
%
%  Discussion:
%
%    A restricted growth function on N is a vector (V(1), ..., V(N) )
%    of values V(I) between 1 and N, satisfying the requirements:
%      V(1) = 1;
%      V(I) <= 1 + max ( V(1), V(2), ..., V(I-1) ).
%
%    The number of restricted growth functions on N is equal to
%    the Bell number B(N).
%
%    There is a bijection between restricted growth functions on N
%    and set partitions of N.
%
%  Example:
%
%    The 15 restricted growth functions for N = 4 are:
%
%    (1111), (1112), (1121), (1122), (1123),
%    (1211), (1212), (1213), (1221), (1222),
%    (1223), (1231), (1232), (1233), (1234).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton and Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, New York, 1986, page 19.
%
%  Parameters:
%
%    Input, integer N, the number of components in the restricted
%    growth function.
%
%    Input, integer V(N), the output value of V from the previous call.
%    This value is not needed on an initial call with DONE = TRUE.
%
%    Input, integer VMAX(N), the output value of VMAX from the previous call.
%    This value is not needed on an initial call with DONE = TRUE.
%
%    Input, logical DONE, should be set to TRUE on an initial call to begin
%    a sequence of computations.  On subsequent calls, it should be set to the
%    output value of DONE from the previous call.
%
%    Output, integer V(N), the componentwise values of the next restricted
%    growth function.
%
%    Output, integer VMAX(N), records the largest value that component V(I)
%    could take, given the values of components 1 through I-1.
%
%    Output, logical DONE, will be FALSE if the routine has computed another
%    restricted growth function, or TRUE if all the restricted
%    growth functions have been returned.
%

%
%  First call:
%
  if ( done )

    v(1:n) = 1;

    vmax(1) = 1;
    vmax(2:n) = 2;

    done = 0;
%
%  Later calls.
%
  else

    j = n;

    while ( 1 )

      if ( j == 1 )
        done = 1;
        return
      end

      if ( v(j) ~= vmax(j) )
        break;
      end

      j = j - 1;

    end

    v(j) = v(j) + 1;

    for i = j+1 : n

      v(i) = 1;

      if ( v(j) == vmax(j) )
        vmax(i) = vmax(j) + 1;
      else
        vmax(i) = vmax(j);
      end

    end

  end

  return
end
