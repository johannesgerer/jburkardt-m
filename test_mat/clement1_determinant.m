function value = clement1_determinant ( n )

%*****************************************************************************80
%
%% CLEMENT1_DETERMINANT returns the determinant of the CLEMENT1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
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
  if ( mod ( n, 2 ) == 1 )

    value = 0.0;

  else

    value = 1.0;
    for i = 1 : 2 : n - 1
      value = value * ( i * ( n - i ) );
    end

    if ( mod ( n / 2, 2 ) == 1 )
      value = - value;
    end

  end

  return
end
