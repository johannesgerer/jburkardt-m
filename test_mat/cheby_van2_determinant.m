function determ = cheby_van2_determinant ( n )

%*****************************************************************************80
%
%% CHEBY_VAN2_DETERMINANT returns the determinant of the CHEBY_VAN2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  if ( n <= 0 )
    determ = 0.0;
  elseif ( n == 1 )
    determ = 1.0;
  else
    determ = r8_mop ( floor ( n / 2 ) ) * sqrt ( 2.0 )^( 4 - n );
  end

  return
end
