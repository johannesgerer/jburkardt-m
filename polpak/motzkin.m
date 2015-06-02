1function a = motzkin ( n )

%*****************************************************************************80
%
%% MOTZKIN returns the Motzkin numbers up to order N.
%
%  Discussion:
%
%    The Motzkin number A(N) counts the number of distinct paths
%    from (0,0) to (0,N) in which the only steps used are
%    (1,1), (1,-1) and (1,0), and the path is never allowed to
%    go below the X axis.
%
%  First values:
%
%     N  A(N)
%
%     0    1
%     1    1
%     2    2
%     3    4
%     4    9
%     5   21
%     6   51
%     7  127
%     8  323
%     9  835
%    10 2188
%
%  Recursion:
%
%    A(N) = A(N-1) + sum ( 0 <= K <= N-2 ) A(K) * A(N-2-K)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 1998
%
%  Parameters:
%
%    Input, integer N, the highest order Motzkin number to compute.
%
%    Output, integer A(1:N+1), the Motzkin numbers.
%
  if ( n < 0 )
    a = [];
    return
  end

  a(1) = 1;

  for i = 1 : n
    a(i+1) = a(i);
    for j = 0 : i-2
      a(i+1) = a(i+1) + a(j+1) * a(i-1-j);
    end
  end

  return
end
