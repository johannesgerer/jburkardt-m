function value = legendre_determinant ( n )

%*****************************************************************************80
%
%% LEGENDRE_DETERMINANT returns the determinant of the LEGENDRE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
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
  t = 1.0;

  for i = 3 : n
    t = t * ( 2 * i - 3 ) / (  i - 1 );
    value = value * t;
  end

  return
end
