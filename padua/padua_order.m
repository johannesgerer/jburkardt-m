function n = padua_order ( l )

%*****************************************************************************80
%
%% PADUA_ORDER returns the size of the Padua set of given level.
%
%  Discussion:
%
%    The Padua sets are indexed by a level that starts at 0.
%    This function returns the number of points in each level.
%
%  Example:
%
%    Level   Size
%    -----   ----
%        0      1
%        1      3
%        2      6
%        3     10
%        4     15
%        5     21
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Bivariate interpolation on the square at new nodal sets,
%    Applied Mathematics and Computation,
%    Volume 165, Number 2, 2005, pages 261-274.
%
%  Parameters:
%
%    Input, integer L, the level of the set.
%    0 <= L
%
%    Output, integer N, the order (number of points) in the set.
%
  n = 0;
  for i = 0 : l
    n = n + floor ( l / 2 ) + 1;
    if ( mod ( l, 2 ) == 1 && mod ( i, 2 ) == 1 )
      n = n + 1;
    end
  end

  return
end