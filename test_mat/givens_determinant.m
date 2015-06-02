function value = givens_determinant ( n )

%*****************************************************************************80
%
%% GIVENS_DETERMINANT returns the determinant of the GIVENS matrix.
%
%  Discussion:
%
%    Since a formula for the eigenvalues is known, we compute the
%    determinant as the product of those values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the determinant.
%
  value = 1.0;

  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / ( 4 * n );
    value = value * 0.5 / ( cos ( angle ) )^2;
  end

  return
end
