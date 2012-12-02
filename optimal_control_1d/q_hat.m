function q = q_hat ( x )

%*****************************************************************************80
%
%% Q_HAT evaluates the optimal control function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2011
%
%  Author:
%
%    Jeff Borggaard, John Burkardt, Catalin Trenchea, Clayton Webster
%
%  Parameters:
%
%    Input, real X(*), the evaluation points.
%
%    Output, real Q(*), the function values.
%
  q = 1 + x.^3;

  return
end
