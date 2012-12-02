function [ a, more ] = vec_next ( n, base, a, more)

%*****************************************************************************80
%
%% VEC_NEXT generates all N-vectors of integers modulo a given base.
%
%  Example:
%
%    N = 2,
%    BASE = 3
%
%    0   0
%    0   1
%    0   2
%    1   0
%    1   1
%    1   2
%    2   0
%    2   1
%    2   2
%
%  Discussion:
%
%    The vectors are produced in lexical order, starting with
%    (0,0,...,0), (0,0,...,1), ... through (BASE-1,BASE-1,...,BASE-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the vectors to be used.
%
%    Input, integer BASE, the base to be used.  BASE = 2 will
%    give vectors of 0's and 1's, for instance.
%
%    Input, integer A(N), except on the first call, this should
%    be the output value of A on the last call.
%
%    Input, logical MORE, should be FALSE on the first call, and
%    thereafter should be the output value of MORE from the previous call.  
%
%    Output, integer A(N), the next vector.
%
%    Output, logical MORE, is TRUE on return, if there are more
%    vectors in the sequence.
%
  persistent kount;
  persistent last;

  if ( ~more )

    kount = 1;
    last = base^n;
    more = 1;
    a(1:n) = 0;

  else
      
    a(1:n) = a(1:n);
    kount = kount + 1;

    if ( kount == last )
      more = 0;
    end

    a(n) = a(n) + 1;

    for i = 1 : n

      nn = n - i;

      if ( a(nn+1) < base )
        return
      end

      a(nn+1) = 0;

      if ( nn ~= 0 )
        a(nn) = a(nn) + 1;
      end

    end

  end

  return
end
