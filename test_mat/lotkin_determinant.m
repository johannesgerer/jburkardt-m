function determ = lotkin_determinant ( n )

%*****************************************************************************80
%
%% LOTKIN_DETERMINANT returns the determinant of the Lotkin matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
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
  delta = 1.0;

  for i = 2 : n
    delta = - comb ( 2 * i - 2, i - 2 ) * comb ( 2 * i - 2, i - 1 ) ...
      * ( 2 * i - 1 ) * delta;
  end

  determ = 1.0 / delta;

  return
end
