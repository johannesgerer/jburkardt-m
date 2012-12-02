function amax_index = r8vec_amax_index ( n, a )

%*****************************************************************************80
%
%% R8VEC_AMAX_INDEX returns the index of the maximum absolute value in an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
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
%    Output, integer AMAX_INDEX, the index of the entry of largest magnitude.
%
  if ( n <= 0 )

    amax_index = -1;

  else

    amax_index = 1;
    amax = abs ( a(1) );

    for i = 2 : n
      if ( amax < abs ( a(i) ) )
        amax_index = i;
        amax = abs ( a(i) );
      end
    end

  end

  return
end
