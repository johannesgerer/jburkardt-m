function a = r8vec_chebyshev ( n, a_first, a_last )

%*****************************************************************************80
%
%% R8VEC_CHEBYSHEV creates a vector of Chebyshev spaced values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A_FIRST, A_LAST, the first and last entries.
%
%    Output, real A(N), a vector of Chebyshev spaced data.
%
  if ( n == 1 )

    a(1) = ( a_first + a_last ) / 2.0;

  else

    for i = 1 : n

      theta = ( n - i ) * pi / ( n - 1 );

      c = cos ( theta );

      if ( mod ( n, 2 ) == 1 )
        if ( 2 * i - 1 == n )
          c = 0.0;
        end
      end

      a(i) = ( ( 1.0 - c ) * a_first  ...
             + ( 1.0 + c ) * a_last ) ...
             /   2.0;

    end

  end

  return
end
