function [ a, b, num_frac ] = rat_farey ( n, max_frac )

%*****************************************************************************80
%
%% RAT_FAREY computes the N-th row of the Farey fraction table.
%
%  Example:
%
%    N = 5
%
%    NUM_FRAC = 11
%    A =  0  1  1  1  2  1  3  2  3  4  1
%    B =  1  5  4  3  5  2  5  3  4  5  1
%
%  Discussion:
%
%    In this form of the Farey fraction table, fractions in row N lie between
%    0 and 1, are in lowest terms, and have a denominator that is no greater
%    than N.  Row N is computed directly, and does not require the computation
%    of previous rows.
%
%    The data satisfy the relationship:
%
%      A(K+1) * B(K) - A(K) * B(K+1) = 1
%
%    The number of items in the N-th row is roughly N**2 / PI**2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms,
%    Addison Wesley, 1968, page 157.
%
%  Parameters:
%
%    Input, integer N, the desired row number.  N must be positive.
%
%    Input, integer MAX_FRAC, the maximum number of fractions to compute.
%
%    Output, integer A(NUM_FRAC), B(NUM_FRAC), contains the
%    numerators and denominators of the N-th row of the Farey fraction table.
%
%    Output, integer NUM_FRAC, the number of fractions computed.
%
  if ( n <= 0 )
    a = [];
    b = [];
    num_frac = 0;
    return
  end

  if ( max_frac <= 0 )
    a = [];
    b = [];
    num_frac = 0;
    return
  end

  k = 1;
  a(k) = 0;
  b(k) = 1;

  if ( max_frac <= 1 )
    num_frac = k;
    return
  end

  k = 2;
  a(k) = 1;
  b(k) = n;

  while ( k < max_frac )

    if ( a(k) == 1 & b(k) == 1 )
      break
    end

    k = k + 1;
    c = floor ( ( b(k-2) + n ) / b(k-1) );
    a(k) = c * a(k-1) - a(k-2);
    b(k) = c * b(k-1) - b(k-2);

  end

  num_frac = k;

  return
end
