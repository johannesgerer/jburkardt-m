function max_index = i4vec_max_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_MAX_INDEX returns the index of the largest entry in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of integer values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be searched.
%
%    Output, integer MAX_INDEX, the index of the largest entry.
%
  if ( n <= 0 )

    max_index = 0;

  else

    amax = a(1);
    max_index = 1;

    for i = 2 : n

      if ( amax < a(i) )
        amax = a(i);
        max_index = i;
      end

    end

  end

  return
end
