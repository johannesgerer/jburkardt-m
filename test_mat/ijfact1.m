function a = ijfact1 ( n )

%*****************************************************************************80
%
%% IJFACT1 returns the IJFACT1 matrix.
%
%  Formula:
%
%    A(I,J) = (I+J)!
%
%  Example:
%
%    N = 4
%
%     2   6   24   120
%     6  24  120   720
%    24 120  720  5040
%   120 720 5040 40320
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
%    A is integral: int ( A ) = A.
%
%    The family of matrices is nested as a function of N.
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
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  fact = 1;

  for k = 2 : 2 * n

    fact = fact * k;
    ilo = max ( 1, k - n );
    ihi = min ( n, k - 1 );

    for i = ilo : ihi
      a(i,k-i) = fact;
    end

  end

  return
end
