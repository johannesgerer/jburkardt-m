function a = ijfact2 ( n )

%*****************************************************************************80
%
%% IJFACT2 returns the 1/(I+J) factorial matrix.
%
%  Formula:
%
%    A(I,J) = 1 / ( (I+J)% )
%
%  Example:
%
%    N = 4
%
%   1/2   1/6   1/24   1/120
%   1/6   1/24  1/120  1/720
%   1/24  1/120 1/720  1/5040
%   1/120 1/720 1/5040 1/40320
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    MJC Gover,
%    The explicit inverse of factorial Hankel matrices,
%    Department of Mathematics, University of Bradford, 1993.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  fact = 1.0;

  for k = 2 : 2 * n

    fact = fact * k;
    ilo = max ( 1, k - n );
    ihi = min ( n, k - 1 );

    for i = ilo : ihi
      a(i,k-i) = 1.0 / fact;
    end

  end

  return
end
