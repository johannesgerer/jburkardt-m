function value = bernstein_determinant ( n )

%*****************************************************************************80
%
%% BERNSTEIN_DETERMINANT returns the determinant of the BERNSTEIN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the determinant.
%
  value = 1.0;
  for i = 0 : n - 1
    value = value * r8_choose ( n - 1, i );
  end

  return
end
