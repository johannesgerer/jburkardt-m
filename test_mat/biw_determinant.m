function value = biw_determinant ( n )

%*****************************************************************************80
%
%% BIW_DETERMINANT computes the determinant of the BIW matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2015
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
  for i = 1 : n
    value = value * ( 0.5 + i / real ( 10 * n ) );
  end

  return
end