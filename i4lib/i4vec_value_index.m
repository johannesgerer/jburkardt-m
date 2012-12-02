function [ n_index, value_index ] = i4vec_value_index ( n, a, value, max_index )

%*****************************************************************************80
%
%% I4VEC_VALUE_INDEX indexes I4VEC entries equal to a given value.
%
%  Example:
%
%    Input:
%
%      N = 10
%      A = (  2, 3, 1, 3, 2, 4, 2, 3, 5, 3 )
%      VALUE = 3
%
%    Output:
%
%      N_INDEX = 4
%      VALUE_INDEX = ( 2, 4, 8, 10 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, integer A(N), the array to be indexed.
%
%    Input, integer VALUE, a value to be searched for.
%
%    Input, integer MAX_INDEX, the maximum number of indices to find.
%
%    Output, integer N_INDEX, the number of entries equal to VALUE.
%
%    Output, integer VALUE_INDEX(MAX_INDEX), the indices of entries
%    equal to VALUE.
%
  n_index = 0;

  for i = 1 : n

    if ( a(i) == value )

      if ( max_index <= n_index )
        return
      end

      n_index = n_index + 1;
      value_index(n_index) = i;

    end

  end

  return
end
