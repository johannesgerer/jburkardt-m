function mean = erlang_mean ( a, b, c )

%*****************************************************************************80
%
%% ERLANG_MEAN returns the mean of the Erlang PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  mean =  a + b * c;

  return
end
