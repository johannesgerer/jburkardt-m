function [ height, ival, val ] = p09_gx ( option )

%*****************************************************************************80
%
%% P09_GX is used by problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Output, real HEIGHT, the height of the structure.
%
%    Output, integer IVAL, the index of the variable being fixed.
%
%    Output, real VAL, the value of the fixed variable.
%
  height = 2.0;
  ival = 4;

  if ( option == 1 | option == 5 | option == 9 )
    val = 0.00;
  elseif ( option == 2 | option == 6 | option == 10 )
    val = 0.25;
  elseif ( option == 3 | option == 7 | option == 11 )
    val = 0.50;
  elseif ( option == 4 | option == 8 | option == 12 )
    val = 1.00;
  elseif ( option == 13 )
    val = 0.00;
  end

  return
end
