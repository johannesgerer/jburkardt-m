function a = boothroyd_inverse ( n )

%*****************************************************************************80
%
%% BOOTHROYD_INVERSE returns the inverse of the BOOTHROYD matrix.
%
%  Example:
%
%    N = 5
%
%      5   -10    10    -5     1
%    -15    40   -45    24    -5
%     35  -105   126   -70    15
%    -70   224  -280   160   -35
%    126  -420   540  -315    70
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
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
  a = zeros ( n, n );

  for i = 1 : n

    for j = 1 : n

      sign_ij = ( - 1.0 )^( i + j );

      a(i,j) = sign_ij * r8_choose ( n+i-1, i-1 ) ...
        * r8_choose ( n-1, n-j ) * n / ( i + j - 1 );

    end

  end

  return
end
