function [ x, seed ] = hypergeometric_sample ( n, m, l, seed )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_SAMPLE samples the Hypergeometric PDF.
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
%  Reference:
%
%    Jerry Banks, editor,
%    Handbook of Simulation,
%    Engineering and Management Press Books, 1998, page 165.
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  c1_log = binomial_coef_log ( l - m, n );
  c2_log = binomial_coef_log ( l, n,  );

  a = exp ( c1_log - c2_log );
  b = a;

  [ u, seed ] = r8_uniform_01 ( seed );

  x = 0;

  while ( a < u )

    b = b * ( m - x ) * ( n - x ) ...
      / ( ( x + 1 ) * ( l - m - n + x + 1 ) );

    a = a + b;

    x = x + 1;

  end

  return
end
