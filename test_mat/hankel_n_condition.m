function value = hankel_n_condition ( n )

%*****************************************************************************80
%
%% HANKEL_N_CONDITION returns the L1 condition of the HANKEL_N matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  v = zeros ( n, 1 );

  v(1) = 1.0 / n;
  for i = 2 : n
    v(i) = 0.0;
    for j = 1 : i - 1
      v(i) = v(i) - ( n + j - i ) * v(j);
    end
    v(i) = v(i) / n;
  end

  a_norm = ( n * ( n + 1 ) ) / 2;
  b_norm = sum ( abs ( v(1:n) ) );
  value = a_norm * b_norm;

  return
end
