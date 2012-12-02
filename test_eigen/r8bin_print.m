function r8bin_print ( bin_num, bin, bin_limit, title )

%*****************************************************************************80
%
%% R8BIN_PRINT prints the bins of a real vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ( kind = 4 ) BIN_NUM, the number of bins.
%
%    Input, integer ( kind = 4 ) BIN(1:BIN_NUM+2).
%    BIN(1) counts entries of X less than BIN_LIMIT(1).
%    BIN(BIN_NUM+2) counts entries greater than or equal to BIN_LIMIT(BIN_NUM+1).
%    For 2 <= I <= BIN_NUM+1, BIN(I) counts the entries X(J) such that
%      BIN_LIMIT(I-1) <= X(J) < BIN_LIMIT(I).
%    where H is the bin spacing.
%
%    Input, real BIN_LIMIT(1:BIN_NUM+1), the "limits" of the bins.
%    BIN(I) counts the number of entries X(J) such that
%      BIN_LIMIT(I-1) <= X(J) < BIN_LIMIT(I).
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Index     Lower Limit   Count     Upper Limit\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %6d                  %6d  %14g\n', 0, bin(1), bin_limit(1) );
  for i = 1 : bin_num
    fprintf ( 1, '  %6d  %14g  %6d  %14g\n', ...
      i, bin_limit(i), bin(i+1), bin_limit(i+1) );
  end
  fprintf ( 1, '  %6d  %14g  %6d\n', ...
    bin_num + 1, bin_limit(bin_num+1), bin(bin_num+2) );

  return
end
