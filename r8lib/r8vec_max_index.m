function max_index = r8vec_max_index ( n, a )

%*****************************************************************************80
%
%% R8VEC_MAX_INDEX returns the index of the maximum value in an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2005
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
%    Output, integer MAX_INDEX, the index of the largest entry.
%
  if ( n <= 0 )

    max_index = -1;

  else

    max_index = 1;

    for i = 2 : n
      if ( a(max_index) < a(i) )
        max_index = i;
      end
    end

  end

  return
end
