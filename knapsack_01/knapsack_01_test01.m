function knapsack_01_test01 ( )

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
%    21 August 2014
%
%  Author:
%
%    John Burkardt
%
  w = [ 16, 17, 23, 24, 39, 40 ]';
  c = 100;
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KNAPSACK_01_TEST01:\n' );
  fprintf ( 1, '  Knapsack maximum capacity is %d\n', c );
  fprintf ( 1, '  Come as close as possible to filling the knapsack.\n' );

  s = knapsack_01 ( n, w, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   # 0/1  Weight\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %1d  %4d\n', i, s(i), w(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total: %4d\n', s'*w );

  return
end

