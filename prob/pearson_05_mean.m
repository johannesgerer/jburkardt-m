function mean = pearson_05_mean ( a, b, c )

%*****************************************************************************80
%
%% PEARSON_05_MEAN evaluates the mean of the Pearson 5 PDF.
%
%  Discussion:
%
%    The mean is undefined for B <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < A, 0.0 < B.
%
%    Output, real MEAN, the mean of the PDF.
%
  if ( b <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PEARSON_05_MEAN - Warning!\n' );
    fprintf ( 1, '  MEAN undefined for B <= 1.\n' );
    mean = c;
    return
  end

  mean = c + a / ( b - 1.0 );

  return
end
