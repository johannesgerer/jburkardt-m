function value = r8mat_plot_symbol ( r )

%*****************************************************************************80
%
%% R8MAT_PLOT_SYMBOL returns a symbol for an R8 value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, a value whose symbol is desired.
%
%    Output, character VALUE, is
%    '-' if R is negative,
%    '0' if R is zero,
%    '+' if R is positive.
%
  if ( r < 0.0 )
    value = '-';
  elseif ( r == 0.0 )
    value = '0';
  elseif ( 0.0 < r )
    value = '+';
  end

  return
end
