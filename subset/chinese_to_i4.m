function j = chinese_to_i4 ( n, m, r )

%*****************************************************************************80
%
%% CHINESE_TO_I4 converts a set of Chinese remainders to an equivalent integer.
%
%  Discussion:
%
%    Given a set of N pairwise prime, positive moduluses M(I), and
%    a corresponding set of remainders R(I), this routine finds an
%    integer J such that, for all I,
%
%      J = R(I) mod M(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of moduluses.
%
%    Input, integer M(N), the moduluses.  These should be positive
%    and pairwise prime.
%
%    Input, integer R(N), the Chinese remainder representation of the integer.
%
%    Output, integer J, the corresponding integer.
%
  ierror = chinese_check ( n, m );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHINESE_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  The moduluses are not legal.\n' );
    error ( 'CHINESE_TO_I4 - Fatal error!' );
  end
%
%  Set BIG_M.
%
  big_m = prod ( m(1:n) );
%
%  Solve BIG_M / M(I) * B(I) = 1, mod M(I)
%
  for i = 1 : n
    a = big_m / m(i);
    c = 1;
    [ b(i), ierror ] = congruence ( a, m(i), c );
  end
%
%  Set J = sum ( 1 <= I <= N ) ( R(I) * B(I) * BIG_M / M(I) ) mod M
%
  j = 0;
  for i = 1 : n
    j = mod ( j + r(i) * b(i) * ( big_m / m(i) ), big_m );
  end

  return
end
