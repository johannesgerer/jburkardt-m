function s = knapsack_01 ( n, w, c )

%*****************************************************************************80
%
%% KNAPSACK_01 seeks a solution of the 0/1 Knapsack problem.
%
%  Discussion:
%
%    In the 0/1 knapsack problem, a knapsack of capacity C is given,
%    as well as N items, with the I-th item of weight W(I).
%
%    A selection is "acceptable" if the total weight is no greater than C.
%
%    It is desired to find an optimal acceptable selection, that is,
%    an acceptable selection such that there is no acceptable selection
%    of greater weight.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of weights.
%
%    Input, integer W(N), the weights.
%
%    Input, integer C, the maximum weight.
%
%    Output, integer S[N], is a binary vector which defines an optimal
%    selection.  It is 1 for the weights to be selected, and 0 otherwise.
%
  more = 0;
  ncard = 0;

  s_test = zeros ( n, 1 );
  t_test = 0;

  s_opt = s_test;
  t_opt = 0;

  while ( 1 )

    [ s_test, more, ncard, iadd ] = subset_gray_next ( n, s_test, more, ncard );
    t_test = s_test' * w;

    if ( t_opt < t_test && t_test <= c )
      t_opt = t_test;
      s_opt = s_test;
    end

    if ( ~more )
      break
    end

  end

  s = s_opt;

  return
end

