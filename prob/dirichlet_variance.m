function variance = dirichlet_variance ( n, a )

%*****************************************************************************80
%
%% DIRICHLET_VARIANCE returns the variances of the Dirichlet PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
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
%    Output, real VARIANCE(N), the variances of the PDF.
%
  a_sum = sum ( a(1:n) );

  for i = 1 : n
    variance(i) = a(i) * ( a_sum - a(i) ) / ( a_sum^2 * ( a_sum + 1.0 ) );
  end

  return
end
