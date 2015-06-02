function value = orth_symm_condition ( n )

%*****************************************************************************80
%
%% ORTH_SYMM_DETERMINANT returns the L1 condition of the ORTH_SYMM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 0.0;
  j = 1;
  for i = 1 : n
    angle = 2.0 * i * j * pi / ( 2 * n + 1 );
    a_norm = a_norm + 2.0 * abs ( sin ( angle ) ) / sqrt ( 2 * n + 1 );
  end
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
