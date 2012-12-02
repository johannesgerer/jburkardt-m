function sum_max_index = r8vec2_sum_max_index ( n, a, b )

%*****************************************************************************80
%
%% R8VEC2_SUM_MAX_INDEX returns the index of the maximum sum of two R8VEC's.
%
%  Discussion:
%
%    An R8VEC2 is two R8VEC's.
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), B(N), two arrays whose sum
%    is to be examined.
%
%    Output, integer SUM_MAX_INDEX, the index of the largest entry in A+B.
%
  if ( n <= 0 )

    sum_max_index = -1;

  else

    sum_max_index = 1;
    sum_max = a(1) + b(1);

    for i = 2 : n
      if ( sum_max < a(i) + b(i) )
        sum_max = a(i) + b(i);
        sum_max_index = i;
      end
    end

  end

  return
end
