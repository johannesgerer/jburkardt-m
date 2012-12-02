function equiv_print2 ( n, s, title )

%*****************************************************************************80
%
%% EQUIV_PRINT2 prints a partition of a set.
%
%  Discussion:
%
%    The partition is printed using the parenthesis format.
%
%    For example, here are the partitions of a set of 4 elements:
%
%      (1,2,3,4)
%      (1,2,3)(4)
%      (1,2,4)(3)
%      (1,2)(3,4)
%      (1,2)(3)(4)
%      (1,3,4)(2)
%      (1,3)(2,4)
%      (1,3)(2)(4)
%      (1,4)(2,3)
%      (1)(2,3,4)
%      (1)(2,3)(4)
%      (1,4)(2)(3)
%      (1)(2,4)(3)
%      (1)(2)(3,4)
%      (1)(2)(3)(4)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set.
%
%    Input, integer S(N), defines the partition.  
%    Element I belongs to subset S(I).
%
%    Input, string TITLE, a title to be printed first.
%
  if ( s_len_trim ( title ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  s_max = max ( s(1:n) );

  for j = 1 : s_max

    fprintf ( 1, '(' );
    size = 0;
    for i = 1 : n
      if ( s(i) == j )
        if ( 0 < size )
          fprintf ( 1, ',' );
        end
        fprintf ( 1, '%d', i );
        size = size + 1;
      end
    end
    fprintf ( 1, ')' );

  end
  fprintf ( 1, '\n' );

  return
end
