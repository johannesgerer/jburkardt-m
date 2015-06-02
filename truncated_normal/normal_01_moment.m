function value = normal_01_moment ( order )

%*****************************************************************************80
%
%% NORMAL_01_MOMENT evaluates moments of the Normal 01 PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Output, real VALUE, the value of the moment.
%
  if ( mod ( order, 2 ) == 0 )
    value = r8_factorial2 ( order - 1 );
  else
    value = 0.0;
  end

  return
end
