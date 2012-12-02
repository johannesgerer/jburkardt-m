function m2 = dirichlet_moment2 ( n, a )

%*****************************************************************************80
%
%% DIRICHLET_MOMENT2 returns the second moments of the Dirichlet PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components.
%
%    Input, real A(N), the probabilities for each component.
%    Each A(I) should be positive.
%
%    Output, real M2(N,N), the second moments of the PDF.
%
  a_sum = sum ( a(1:n) );

  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        m2(i,j) = a(i) * ( a(i) + 1.0 ) / ( a_sum * ( a_sum + 1.0 ) );
      else
        m2(i,j) = a(i) * a(j) / ( a_sum * ( a_sum + 1.0 ) );
      end
    end
  end

  return
end
