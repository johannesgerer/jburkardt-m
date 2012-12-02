function [ p, rank ] = perm_tj_successor ( n, p, rank )

%*****************************************************************************80
%
%% PERM_TJ_SUCCESSOR computes the Trotter-Johnson permutation successor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of values being permuted.
%    N must be positive.
%
%    Input/output, integer P(N), describes the permutation.
%    P(I) is the item which is permuted into the I-th place
%    by the permutation.
%
%    Input/output, integer RANK, the rank.
%    If RANK = -1 on input, then the routine understands that this is
%    the first call, and that the user wishes the routine to supply
%    the first element in the ordering, which has RANK = 0.  
%    In general, the input value of RANK is increased by 1 for output,
%    unless the very last element of the ordering was input, in which
%    case the output value of RANK is 0.
%

%
%  Return the first element.
%
  if ( rank == -1 )
    p = 1 : n;
    rank = 0;
    return
  end
%
%  Check.
%
  missing = perm_check ( n, p );

  if ( missing ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_TJ_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  Missing element = ', missing );
    error ( 'PERM_TJ_SUCCESSOR - Fatal error!' );
  end

  st = 0;
  q(1:n) = p(1:n);
  done = 0;
  m = n;

  while ( 1 < m && ~done ) 

    d = 1;
    while ( q(d) ~= m ) 
      d = d + 1;
    end

    for i = d : m - 1
      q(i) = q(i+1);
    end

    par = perm_parity ( m - 1, q );

    if ( par == 1 )

      if ( d == m )
        m = m - 1;
      else
        t         = p(st+d);
        p(st+d)   = p(st+d+1);
        p(st+d+1) = t;
        done = 1;
      end

    else

      if ( d == 1 )
        m = m - 1;
        st = st + 1;
      else
        t         = p(st+d);
        p(st+d)   = p(st+d-1);
        p(st+d-1) = t;
        done = 1;
      end

    end

  end
%
%  Last element was input.  Return first one.
%
  if ( m == 1 )
    p = 1 : n;
    rank = 0;
    return
  end

  rank = rank + 1;

  return
end
