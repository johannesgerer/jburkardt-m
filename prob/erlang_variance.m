function variance = erlang_variance ( a, b, c )

%*****************************************************************************80
%
%% ERLANG_VARIANCE returns the variance of the Erlang PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, integer C, the parameters of the PDF.
%    0.0 < B.
%    0 < C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance =  b * b * c;

  return
end
