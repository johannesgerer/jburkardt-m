function [ x, seed ] = erlang_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% ERLANG_SAMPLE samples the Erlang PDF.
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
%    0.0D+00 < B.
%    0 < C.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a2 = 0.0;
  b2 = b;
  x = a;
  for i = 1 : c
    [ x2, seed ] = exponential_sample ( a2, b2, seed );
    x = x + x2;
  end

  return
end
