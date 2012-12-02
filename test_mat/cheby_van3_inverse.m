function a = cheby_van3_inverse ( n )

%*****************************************************************************80
%
%% CHEBY_VAN3_INVERSE inverts the Chebyshev Vandermonde-like matrix.
%
%  Formula:
%
%    if J == 1 then
%      A(I,J) = (1/N) * cos ( (I-1/2) * (J-1) * PI / N )
%    else if 1 < J then
%      A(I,J) = (2/N) * cos ( (I-1/2) * (J-1) * PI / N )
%
%  Example:
%
%    N = 4
%
%    1/4  1/2 cos(  PI/8)  1/2 cos( 2*PI/8)  1/2 cos( 3*PI/8)
%    1/4  1/2 cos(3*PI/8)  1/2 cos( 6*PI/8)  1/2 cos( 9*PI/8)
%    1/4  1/2 cos(5*PI/8)  1/2 cos(10*PI/8)  1/2 cos(15*PI/8)
%    1/4  1/2 cos(7*PI/8)  1/2 cos(14*PI/8)  1/2 cos(21*PI/8)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      angle = ( 2 * i - 1 ) * ( j - 1 ) * pi / ( 2 * n );

      a(i,j) = cos ( angle ) / n;

    end
  end

  a(1:n,2:n) = 2.0 * a(1:n,2:n);

  return
end
