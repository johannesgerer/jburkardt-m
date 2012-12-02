function determ = hartley_determinant ( n )

%*****************************************************************************80
%
%% HARTLEY_DETERMINANT returns the determinant of the Hartley matrix.
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
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 4 ) == 1 )
    determ =   sqrt ( n^n );
  else
    determ = - sqrt ( n^n );
  end

  return
end
