function amax_index = i4vec_amax_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_AMAX_INDEX returns the index of the largest magnitude in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4 values.
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
%    Output, integer AMAX_INDEX, the index of the entry of largest magnitude.
%
  if ( n <= 0 )

    amax_index = 0;

  else

    aamax = abs ( a(1) );
    amax_index = 1;

    for i = 2 : n

      if ( aamax < abs ( a(i) ) )
        aamax = abs ( a(i) );
        amax_index = i;
      end

    end

  end

  return
end
