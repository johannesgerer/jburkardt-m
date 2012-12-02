function [ a, seed ] = runs_simulate ( m, n, seed )

%*****************************************************************************80
%
%% RUNS_SIMULATE simulates a case governed by the Runs PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the parameters of the PDF.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(M+N), a sequence of M 0's and N 1's chosen
%    uniformly at random.
%
%    Output, integer SEED, a seed for the random number generator.
%
  a(1:m) = 0;
  a(m+1:m+n) = 1;

  for i = 1 : m+n-1

    [ j, seed ] = i4_uniform ( i, m+n, seed );

    k    = a(i);
    a(i) = a(j);
    a(j) = k;

  end

  return
end
