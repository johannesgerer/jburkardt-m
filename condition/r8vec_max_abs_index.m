function max_index = r8vec_max_abs_index ( n, a )

%*****************************************************************************80
%
%% R8VEC_MAX_ABS_INDEX: index of the maximum absolute value in an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), the array.
%
%    Output, integer MAX_INDEX, the index of the entry of
%    maximum absolute value.
%
  if ( n <= 0 )

    max_index = -1;

  else

    max_index = 1;

    for i = 2 : n
      if ( abs ( a(max_index) ) < abs ( a(i) ) )
        max_index = i;
      end
    end

  end

  return
end
