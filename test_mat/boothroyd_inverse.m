function a = boothroyd_inverse ( n )

%*****************************************************************************80
%
%% BOOTHROYD_INVERSE returns the inverse of the BOOTHROYD matrix.
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
  for i = 1 : n

    for j = 1 : n

      sign_ij = ( - 1.0 )^( i + j );

      a(i,j) = sign_ij * comb ( n+i-1, i-1 ) * comb ( n-1, n-j ) * n ...
        / ( i + j - 1 );

    end

  end

  return
end
