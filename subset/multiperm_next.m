function [ a, more ] = multiperm_next ( n, a )

%*****************************************************************************80
%
%% MULTIPERM_NEXT returns the next multipermutation.
%
%  Discussion:
%
%    To begin the computation, the user must set up the first multipermutation.
%    To compute ALL possible multipermutations, this first permutation should
%    list the values in ascending order.
%
%    The routine will compute, one by one, the next multipermutation,
%    in lexicographical order.  On the call after computing the last 
%    multipermutation, the routine will return MORE = FALSE (and will
%    reset the multipermutation to the FIRST one again.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items in the multipermutation.
%
%    Input, integer A[N], the current multipermutation.
%
%    Output, integer A[N], the next multipermutation.
%
%    Output, logical MORE, is TRUE if the next multipermutation
%    was computed, or FALSE if no further multipermutations could
%    be computed.
%

%
%  Step 1:
%  Find M, the last location in A for which A(M) < A(M+1).
%
  m = 0;
  for i = 1 : n-1
    if ( a(i) < a(i+1) )
      m = i;
    end
  end
%
%  Step 2:
%  If no M was found, we've run out of multipermutations.
%
  if ( m == 0 )
    more = 0;
    a = sort ( a(1:n) );
    return
  else
    more = 1;
  end
%
%  Step 3:
%  Ascending sort A(M+1:N).
%
  if ( m + 1 < n )
    a(m+1:n) = sort ( a(m+1:n) );
  end
%
%  Step 4:
%  Locate the first larger value after A(M).
%
  i = 1;
  while ( a(m+i) <= a(m) )
    i = i + 1;
  end
%
%  Step 5:
%  Interchange A(M) and next larger value.
%
  temp = a(m);
  a(m) = a(m+i);
  a(m+i) = temp;

  return
end
