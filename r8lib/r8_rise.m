function value = r8_rise ( x, n )

%*****************************************************************************80
%
%% R8_RISE computes the rising factorial function [X]^N.
%
%  Discussion:
%
%    [X]^N = X * ( X + 1 ) * ( X + 2 ) * ... * ( X + N - 1 ).
%
%    Note that the number of ways of arranging N objects in M ordered
%    boxes is [M]^N.  (Here, the ordering of the objects in each box matters).
%    Thus, 2 objects in 2 boxes have the following 6 possible arrangements:
%
%      -|12, 1|2, 12|-, -|21, 2|1, 21|-.
%
%    Moreover, the number of non-decreasing maps from a set of
%    N to a set of M ordered elements is [M]^N / N!.  Thus the set of
%    nondecreasing maps from (1,2,3) to (a,b,c,d) is the 20 elements:
%
%      aaa, abb, acc, add, aab, abc, acd, aac, abd, aad
%      bbb, bcc, bdd, bbc, bcd, bbd, ccc, cdd, ccd, ddd.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the rising factorial function.
%
%    Input, integer N, the order of the rising factorial function.
%    If N = 0, RISE = 1, if N = 1, RISE = X.  Note that if N is
%    negative, a "falling" factorial will be computed.
%
%    Output, real VALUE, the value of the rising factorial function.
%
  value = 1.0;

  arg = x;

  if ( 0 < n )

    for i = 1 : n
      value = value * arg;
      arg = arg + 1.0;
    end

  elseif ( n < 0 )

    for i = -1 : -1 : n
      value = value * arg;
      arg = arg - 1.0;
    end

  end

  return
end
