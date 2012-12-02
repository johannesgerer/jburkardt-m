function [ x, seed ] = negative_binomial_sample ( a, b, seed )

%*****************************************************************************80
%
%% NEGATIVE_BINOMIAL_SAMPLE samples the Negative Binomial PDF.
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
%    Input, integer A, a parameter of the PDF.
%    0 <= A.
%
%    Input, real B, a parameter of the PDF.
%    0 < B <= 1.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( b == 1.0 )
    x = a;
    return
  elseif ( b == 0.0 )
    x = r8_huge ( );
    return
  end

  x = 0;
  num_success = 0;

  while ( num_success < a )

    x = x + 1;
    [ r, seed ] = r8_uniform_01 ( seed );

    if ( r <= b )
      num_success = num_success + 1;
    end

  end

  return
end
