function [ p, more ] = perm_lex_next ( n, p, more )

%*****************************************************************************80
%
%% PERM_LEX_NEXT generates permutations in lexical order, one at a time.
%
%  Example:
%
%    N = 3
%
%    1   1 2 3
%    2   1 3 2
%    3   2 1 3
%    4   2 3 1
%    5   3 1 2
%    6   3 2 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Mok-Kong Shen,
%    Algorithm 202: Generation of Permutations in Lexicographical Order,
%    Communications of the ACM,
%    Volume 6, September 1963, page 517.
%
%  Parameters:
%
%    Input, integer N, the number of elements being permuted.
%
%    Input, integer P(N), the permutation, in standard index form.
%
%    Input, logical MORE.
%    On the first call, the user should set MORE = FALSE, which signals
%    the routine to do initialization.
%    On return, if MORE is TRUE, then another permutation has been
%    computed and returned, while if MORE is FALSE, there are no more
%    permutations.
%
%    Output, integer P(N), the next permutation.
%
%    Output, logical MORE.
%    On the first call, the user should set MORE = FALSE, which signals
%    the routine to do initialization.
%    On return, if MORE is TRUE, then another permutation has been
%    computed and returned, while if MORE is FALSE, there are no more
%    permutations.
%

%
%  Initialization.
%
  if ( ~more )

    p_ = i4vec_indicator ( n );
    more = 1;

  else

    if ( n <= 1 )
      p = [];
      more = 0;
      return
    end

    w = n;

    while ( p(w) < p(w-1) )

      if ( w == 2 )
        more = 0;
        return
      end

      w = w - 1;

    end

    u = p(w-1);

    for j = n : -1 : w

      if ( u < p(j) )

        p(w-1) = p(j);
        p(j) = u;

        for k = 0 : floor ( ( n - w - 1 ) / 2 )
          [ p(n-k), p(w+k) ] = i4_swap ( p(n-k), p(w+k) );
        end

        return

      end

    end

  end

  return
end
