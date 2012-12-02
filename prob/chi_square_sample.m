function [ x, seed ] = chi_square_sample ( a, seed )

%*****************************************************************************80
%
%% CHI_SQUARE_SAMPLE samples the central Chi squared PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    1 <= A.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  it_max = 100;

  n = floor ( a );

  if ( n == a & n <= it_max )

    x = 0.0;
    for i = 1 : n
      [ x2, seed ] = normal_01_sample ( seed );
      x = x + x2 * x2;
    end

  else

    a2 = 0.0;
    b2 = 1.0;
    c2 = a / 2.0;

    [ x, seed ] = gamma_sample ( a2, b2, c2, seed );

    x = 2.0 * x;

  end

  return
end
