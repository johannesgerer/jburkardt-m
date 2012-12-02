function r = perm_mul ( n, p, q )

%*****************************************************************************80
%
%% PERM_MUL computes the product of two permutations.
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
%    Donald Kreher, Douglas Simpson,inson,
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
%    Input, integer P(N), Q(N), describes the permutation factors.
%
%    Output, integer R(N), the product permutation P * Q.
%    R(I) = P(Q(I)).
%

%
%  Check.
%
  missing = perm_check ( n, p );

  if ( missing ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_MUL - Fatal error!\n' );
    fprintf ( 1, '  The input array P is illegal.\n' );
    fprintf ( 1, '  Missing element = ', missing );
    error ( 'PERM_MUL - Fatal error!' );
  end

  missing = perm_check ( n, q );

  if ( missing ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_MUL - Fatal error!\n' );
    fprintf ( 1, '  The input array Q is illegal.\n' );
    fprintf ( 1, '  Missing element = ', missing );
    error ( 'PERM_MUL - Fatal error!' );
  end

  r(1:n) = p(q(1:n));

  return
end
