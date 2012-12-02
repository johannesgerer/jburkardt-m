function min_index = r8vec_min_index ( n, a )

%*****************************************************************************80
%
%% R8VEC_MIN_INDEX returns the index of the minimum value in an R8VEC.
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
%    Output, integer MIN_INDEX, the index of the smallest entry.
%
  if ( n <= 0 )

    min_index = -1;

  else

    min_index = 1;

    for i = 2 : n
      if ( a(i) < a(min_index) )
        min_index = i;
      end
    end

  end

  return
end
