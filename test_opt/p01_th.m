function th = p01_th ( x )

%*****************************************************************************80
%
%% P01_TH evaluates a term used by problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(2), the values of the variables.
%
%    Output, real TH, the value of the term.
%
  if ( 0.0 < x(1) )
    th = 0.5 * atan ( x(2) / x(1) ) / pi;
  elseif ( x(1) < 0.0 )
    th = 0.5 * atan ( x(2) / x(1) ) / pi + 0.5;
  elseif ( 0.0 < x(2) )
    th = 0.25;
  elseif ( x(2) < 0.0 )
    th = - 0.25;
  else
    th = 0.0;
  end

  return
end
