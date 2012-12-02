function cdf = erlang_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% ERLANG_CDF evaluates the Erlang CDF.
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
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, integer C, the parameters of the PDF.
%    0.0 < B.
%    0 < C.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < a )

    cdf = 0.0;

  else

    x2 = ( x - a ) / b;
    p2 = c;

    cdf = gamma_inc ( p2, x2 );

  end

  return
end
