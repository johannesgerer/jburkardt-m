function mean = hypergeometric_mean ( n, m, l )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_MEAN returns the mean of the Hypergeometric PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = n * m / l;

  return
end
