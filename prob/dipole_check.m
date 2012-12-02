function check = dipole_check ( a, b )

%*****************************************************************************80
%
%% DIPOLE_CHECK checks the parameters of the Dipole CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    A is arbitrary, but represents an angle, so only 0 <= A <= 2 * PI
%    is interesting, and -1.0D+00 <= B <= 1.0.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b < -1.0 | 1.0 < b )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIPOLE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  -1.0 <= B <= 1.0 is required.\n' );
    fprintf ( 1, '  The input B = %f\n', b );
    check = 0;
    return
  end

  check = 1;

  return
end
