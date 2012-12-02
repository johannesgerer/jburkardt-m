function value = cardioid_check ( a, b )

%*****************************************************************************80
%
%% CARDIOID_CHECK checks the parameters of the Cardioid CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    -0.5 <= B <= 0.5.
%
%    Output, logical CARDIOID_CHECK, is true if the parameters are legal.
%
  if ( b < -0.5 | 0.5 < b )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CARDIOID_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < -0.5 or 0.5 < B.\n' );
    value = 0;
    return
  end

  value = 1;

  return
end
