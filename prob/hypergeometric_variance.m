function variance = hypergeometric_variance ( n, m, l )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_VARIANCE returns the variance of the Hypergeometric PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of balls selected.
%    0 <= N <= L.
%
%    Input, integer M, the number of white balls in the population.
%    0 <= M <= L.
%
%    Input, integer L, the number of balls to select from.
%    0 <= L.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = n * m * ( l - m ) * ( l - n ) / ( l * l * ( l - 1 ) );

  return
end
