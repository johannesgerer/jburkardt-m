function ins = perm_ins ( n, p )

%*****************************************************************************80
%
%% PERM_INS computes the inversion sequence of a permutation.
%
%  Discussion:
%
%    For a given permutation P acting on objects 1 through N, the inversion
%    sequence INS is defined as:
%
%      INS(1) = 0
%      INS(I) = number of values J < I for which P(I) < P(J).
%
%  Example:
%
%    Input:
%
%      ( 3, 5, 1, 4, 2 )
%
%    Output:
%
%      ( 0, 0, 2, 1, 3 )
%
%    The original permutation can be recovered from the inversion sequence.
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
%    Springer Verlag, New York, 1986.
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), the permutation, in standard index form.
%    The I-th item has been mapped to P(I).
%
%    Output, integer INS(N), the inversion sequence of the permutation.
%
  ierror = perm_check ( n, p );

  if ( ierror )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INS - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_INS - Fatal error!' );
  end

  ins(1:n) = 0;

  for i = 1 : n
    for j = 1 : i-1
      if ( p(i) < p(j) )
        ins(i) = ins(i) + 1;
      end
    end
  end

  return
end
