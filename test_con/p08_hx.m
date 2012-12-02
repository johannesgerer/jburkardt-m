function [ ival1, ival2,  val1, val2 ] = p08_hx ( option )

%*****************************************************************************80
%
%% P08_HX reports the constraint equation data.
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
%    Output, integer VAL1, IVAL2, the indices of the two constrained
%    variables.
%
%    Output, real VAL1, VAL2, the values to which the two constrained
%    variables are to be set.
%
  ival1 = 4;
  val1 = 0.0;
  ival2 = 5;
  val2 = 0.0;

  return
end
