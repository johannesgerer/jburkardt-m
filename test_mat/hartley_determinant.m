function value = hartley_determinant ( n )

%*****************************************************************************80
%
%% HARTLEY_DETERMINANT returns the determinant of the HARTLEY matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
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
  if ( mod ( n, 4 ) == 1 )
    value =   sqrt ( n ^ n );
  else
    value = - sqrt ( n ^ n );
  end

  return
end
