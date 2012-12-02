function x = r8vec_cheby2space ( n, a, b )

%*****************************************************************************80
%
%% R8VEC_CHEBY2SPACE creates a vector of Type 2 Chebyshev spaced values in [A,B].
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
%    18 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A, B, the first and last entries.
%
%    Output, real X(N,1), a vector of Chebyshev spaced data.
%
  x = zeros ( n, 1 );

  if ( n == 1 )

    x(1) = ( a + b ) / 2.0;

  else

    for i = 1 : n

      theta = ( n - i ) * pi / ( n - 1 );

      c = cos ( theta );

      if ( mod ( n, 2 ) == 1 )
        if ( 2 * i - 1 == n )
          c = 0.0;
        end
      end

      x(i) = ( ( 1.0 - c ) * a  ...
             + ( 1.0 + c ) * b ) ...
             /   2.0;

    end

  end

  return
end
