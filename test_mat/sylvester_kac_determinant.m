function value = sylvester_kac_determinant ( n )

%*****************************************************************************80
%
%% SYLVESTER_KAC_DETERMINANT: determinant of the SYLVESTER_KAC matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2015
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
  if ( mod ( n, 2 ) == 1 )
    value = 0.0;
  else
    value = 1.0;
    for i = - n + 1 : 2 : n - 1
      value = value * i;
    end
  end

  return
end
