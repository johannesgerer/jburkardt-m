function value = r8vec_entropy ( n, x )

%*****************************************************************************80
%
%% R8VEC_ENTROPY computes the entropy of an R8VEC.
%
%  Discussion:
%
%    Typically, the entries represent probabilities, and must sum to 1.
%    For this function, the only requirement is that the entries be nonnegative.
%
%    An R8VEC is a vector of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, real X(N), the vector.
%    Each entry must be nonnegative.
%
%    Output, real VALUE, the entropy of the
%    normalized vector.
%
  if ( any ( x(1:n) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_ENTROPY - Fatal error!\n' );
    fprintf ( 1, '  Some entries are negative.\n' );
    error ( 'R8VEC_ENTROPY - Fatal error!' );
  end

  x_sum = sum ( x(1:n) );

  if ( x_sum == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_ENTROPY - Fatal error!\n' );
    fprintf ( 1, '  Entries sum to 0.\n' );
    error ( 'R8VEC_ENTROPY - Fatal error!' );
  end

  value = 0.0;
  for i = 1 : n
    if ( 0.0 < x(i) )
      xi = x(i) / x_sum;
      value = value - r8_log_2 ( xi ) * xi;
    end
  end

  return
end
